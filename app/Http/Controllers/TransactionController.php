<?php

namespace App\Http\Controllers;

use App\Models\Transaction;
use App\Models\User;
use App\Traits\MpesaUtil;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class TransactionController extends Controller

{
    use MpesaUtil;
    //
    function  daraCallback(Request $request){

        $data = $request->input('Body.stkCallback');

        if (!$data) {
            Log::error("Invalid Daraja callback data received");
            return response()->json([
                'status' => 'error',
                'message' => 'Invalid data'
            ], 400);
        }
        Log::info("Daraja: " . json_encode($data));

        $callbackMetadata = collect($data['CallbackMetadata']['Item']);

        $amount = $callbackMetadata->firstWhere('Name', 'Amount')['Value'];
        $mpesaReceiptNumber = $callbackMetadata->firstWhere('Name', 'MpesaReceiptNumber')['Value'];
        $transactionDate = $callbackMetadata->firstWhere('Name', 'TransactionDate')['Value'];
        $phoneNumber = $callbackMetadata->firstWhere('Name', 'PhoneNumber')['Value'];

        // Convert transaction date from format YYYYMMDDHHMMSS to a proper datetime format
        $transactionDate = \DateTime::createFromFormat('YmdHis', $transactionDate)->format('Y-m-d H:i:s');

//        use the checkout request id to get the user id from the mpesa_transactions table
        $userId = DB::table('mpesa_transactions')->where(
            'checkout_request_id', $data['CheckoutRequestID'])->value('order_id');
//        use the checkout request id to get the invoice id from the mpesa_transactions table
        $invoiceId = DB::table('mpesa_transactions')->where(
            'checkout_request_id', $data['CheckoutRequestID'])->value('invoice_id');
        $payerName = User::where('id', $userId)->value('name');
        $data1  = json_decode(file_get_contents('php://input'), true);

        $TxnDateTime = Carbon::now();
        $CheckoutRequestID = $data1['Body']['stkCallback']['CheckoutRequestID'];
        $ResultCode = $data1['Body']['stkCallback']['ResultCode'];
        $ResultDesc = $data1['Body']['stkCallback']['ResultDesc'];
        $TxnAmount = $data1['Body']['stkCallback']['CallbackMetadata']['Item'][0]['Value'];
        $MpesaReceiptNo = $data1['Body']['stkCallback']['CallbackMetadata']['Item'][1]['Value'];
        $SenderPhoneNo = $data1['Body']['stkCallback']['CallbackMetadata']['Item'][3]['Value'];
        Log::info("Daraja: " . json_encode($data1));
        // Retrieve order_id before performing the update
        $transaction = DB::table('mpesa_transactions')
            ->where('checkout_request_id', $CheckoutRequestID)
            ->first();

        if ($transaction) {
            $update = DB::table('mpesa_transactions')
                ->where('checkout_request_id', $CheckoutRequestID)
                ->update([
                    'result_code' => $ResultCode,
                    'result_desc' => $ResultDesc,
                    'txn_amount' => $TxnAmount,
                    'mpesa_receipt_no' => $MpesaReceiptNo,
                    'sender_phone_no' => $SenderPhoneNo,
                    'updated_at' => $TxnDateTime
                ]);
            $transaction = Transaction::create([
                'user_id' => $userId,
                'invoice_id' => $invoiceId,
                'transaction_id' => $mpesaReceiptNumber,
                'amount' => $amount,
                'status' => $data['ResultCode'] == 0 ? 'success' : 'failed',
                'date_paid' => $transactionDate,
                'payer_name' => $payerName,
            ]);
return response()->json([
    'status' => 'success',
    'message' => 'Transaction successful',

 'update'  => $update,
    'transaction' => $transaction,

    ]);
        } else {
            $data = [
                'status' => 'error',
                'message' => 'Transaction not found.'
            ];
        }




        return response()->json([
            'status' => 'success',
            'message' => 'Transaction successful',
            'transaction' => $transaction
        ]);

    }
    public function allUserMpesaTransactions(Request $request){

        $transactions = Transaction::where('user_id', Auth::id())->get();

        return response()->json([
            'status' => 'success',
            'message' => 'Transactions retrieved successfully',
            'data' => $transactions

        ]);
    }
    public function initiateMpesaPayment(Request $request)
    {
        $callback_url = 'https://invoicesysbackend-production-641c.up.railway.app/daraja-callback';
        $invoice_number = $request->input('invoice_id');
        $phone_no = $this->formatPhoneNumber($request->input('phone_no'));
        $amount = $request->input('amount');

        if ($phone_no != 'Invalid') {



            if ($this->stkPush($phone_no, $invoice_number, $amount,$callback_url)) {

                $data = [
                    'status' => 'success',
                    'message' => 'MPESA STK Push initiated successfully!',
                ];

            } else {

                $data = [
                    'status' => 'error',
                    'message' => 'MPESA STK Push failed please try again.!',
                ];

            }

        } else {

            $data = [
                'status' => 'error',
                'message' => 'Invalid phone number, please check and try again!',
            ];

        }

        return response()->json($data);
    }
}
