<?php

namespace App\Http\Controllers;

use App\Models\Invoice;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Gate;
use PhpParser\Node\Scalar\String_;

class InvoiceController extends Controller
{
    //
    public function  allInvoices(Request $request){

        if(!Gate::allows("admin")){
            return response()->json([
                'error' => 'You are not authorized to perform this action'
                ], 403);
        }
        //get all invoices with associated users
        $invoices = Invoice::all()

            ->load('user')
        ;
        return response()->json([
            'success' => true,
            'data' => $invoices
            ], 200);

    }
    public function  allUserInvoices(Request $request, string $user_id){


        $invoices = Invoice::where('user_id', $user_id)
            ->with('user')
            ->get();


        ;
        return response()->json([
            'success' => true,
            'data' => $invoices
        ], 200);

    }
    public function  invoiceDetails(Request $request,string $invoice_id){
        $invoices_details = Invoice::where('id', $invoice_id)
            ->with('user')
            ->with('transactions')
            ->first()
        ;
        return response()->json([
            'success' => true,
            'data' => $invoices_details
        ], 200);
    }
    public function  createInvoice(Request $request){
        //create invoice
        $request->validate([
            'user_id' => ['required', 'string', 'max:255'],
            'total_amount' => ['required', 'numeric'],
            'due_date' => ['required', 'date'],

        ]);
        $user = User::find($request->user_id);
        if(!$user){
            return response()->json([
                'error' => 'User not found. Invoice can only be created for existing users'
            ], 404);
        }
        //create random unique invoice number
        $invoice_number = uniqid();
        $invoice = Invoice::create([
            'user_id' => $request->user_id,
            'total_amount' => $request->total_amount,
            'due_date' => $request->due_date,
             'balance' => $request->total_amount,
            'invoice_number' => $invoice_number,


        ]);
        return response()->json([
            'success' => true,
            'data' => $invoice
        ], 201);

    }
    public  function  updateInvoice(Request $request,string $invoice_id){
        $request->validate([
            'id' => ['required', 'string', 'max:255'],
            'total_amount' => ['required', 'numeric'],
            'due_date' => ['required', 'date'],

        ]);
        $invoice = Invoice::find($invoice_id);
        if(!$invoice){
            return response()->json([
                'error' => 'Invoice not found'
            ], 404);
        }
        $invoice->total_amount = $request->total_amount;
        $invoice->due_date = $request->due_date;
        $invoice->balance = $request->total_amount - $invoice->paid_amount;
        $invoice->save();
        return response()->json([
            'success' => true,
            'data' => $invoice
        ], 200);

    }


}
