<?php
namespace App\Traits;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

trait MpesaUtil{
//for this util sandbox details are hard coded for simplicity
    /*
    * Generate access Token
    */
    public function getAccessToken($consumerKey, $consumerSecret) {
        $apiUrl = 'https://sandbox.safaricom.co.ke';
        $credentials = base64_encode($consumerKey . ':' . $consumerSecret);

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $apiUrl . '/oauth/v1/generate?grant_type=client_credentials');
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            'Authorization: Basic ' . $credentials,
            'Content-Type: application/json'
        ));
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
        $response = curl_exec($ch);

        if ($response === false) {
            $error = curl_error($ch);
            curl_close($ch);
            \Log::error("cURL Error: " . $error);
            return null;
        }

        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);

        if ($httpCode != 200) {
            \Log::error("HTTP Error: " . $httpCode . " Response: " . $response);
            return null;
        }

        $response = json_decode($response);
        \Log::info("Token response: " . print_r($response, true));

        if (!empty($response) && isset($response->access_token)) {
            $this->access_token = $response->access_token;
            return $this->access_token;
        } else {
            $this->access_token = null;
            return null;
        }
    }

    public function stkPush($phone_no,$invoice_id,$invoice_amount,$callback_url)
    {
        $amount_to_pay=$invoice_amount;
        $partyA=$phone_no;
        $businessShortCode=174379;
        $amount_without_decimal=explode(".",$amount_to_pay);
        $amount=$amount_without_decimal[0];

        \Log::info("Short code ".$businessShortCode);
        \Log::info("Short code ".$amount);

        $callBackUrl=$callback_url;



        /*
        * Generate password
        */
        $timestamp = date('YmdHis');
        $passKey="bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919";
        $passwd = base64_encode($businessShortCode.$passKey.$timestamp);

        /*
        * Generate access token
        */
        $consumerKey="1ro2AjNb0GQT2MQVNDfgBjV4BOncIgeqTqgOaJERZ6eGslJR";
        $consumerSecret="T71A51JaxhMp5w956gde4hfRg51v961fvuAvEDAoWJsZ0KBGVuMttCRDA4UKjzxS";
        $partyB="174379";
        $transaction_type="CustomerPayBillOnline";
        \Log::info("Before acess token");
        $accessToken=$this->getAccessToken($consumerKey,$consumerSecret);
        \Log::info("Access token ".$accessToken);
        if(!empty($accessToken)){


                $url = 'https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest';


            $curl = curl_init();
            curl_setopt($curl, CURLOPT_URL, $url);
            curl_setopt($curl, CURLOPT_HTTPHEADER, array('Content-Type:application/json','Authorization:Bearer '.$accessToken));
            curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE); // Bypass SSL verification
            curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE); //

            $curl_post_data = array(

                'BusinessShortCode' => $businessShortCode,
                'Password' => $passwd,
                'Timestamp' => $timestamp,
                'TransactionType' => $transaction_type,
                'Amount' => $amount,
                'PartyA' => $partyA,
                'PartyB' => $partyB,
                'PhoneNumber' => $partyA,
                'CallBackURL' => $callBackUrl,
                'AccountReference' => $invoice_id,
                'TransactionDesc' => 'Subscription Payment'
            );

            $data_string = json_encode($curl_post_data);

            \Log::info("Curl Post data ".$data_string);

            curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($curl, CURLOPT_POST, true);
            curl_setopt($curl, CURLOPT_POSTFIELDS, $data_string);

            $curl_response = curl_exec($curl);

            $data  = json_decode($curl_response, true);

            \Log::info("Request ".$curl_response);

            if(!empty($data)){
                if(!empty($data['MerchantRequestID'])&&!empty($data['CheckoutRequestID'])){
                    $MerchantRequestID=$data['MerchantRequestID'];
                    $CheckoutRequestID=$data['CheckoutRequestID'];
                    $ResponseCode=$data['ResponseCode'];
                    $ResponseDescription=$data['ResponseDescription'];
                    $CustomerMessage=$data['CustomerMessage'];
                    $request_date_time=Carbon::now();

                    $stk_curl_response=array(
                        "invoice_id"=>$invoice_id,
                        "order_id"=>Auth::id(),
                        "request_date_time"=>$request_date_time,
                        "merchant_request_id"=>$MerchantRequestID,
                        "checkout_request_id"=>$CheckoutRequestID,
                        "response_code"=>$ResponseCode,
                        "response_desc"=>$ResponseDescription,
                        "customer_msg"=>$CustomerMessage,
                        "created_at"=>$request_date_time,
                        "txn_amount"=>$amount,
                    );

                    //Set Checkout Request ID in session for use in verifying payment
                    session()->put('CheckoutRequestID', $CheckoutRequestID);

                    //Save MPESA payment details
                    $log_stk_curl_resp=DB::table('mpesa_transactions')->insert([$stk_curl_response]);
                    if($log_stk_curl_resp){
                        \Log::info("STK curl response was saved successfully!");

                        return true;
                    }else{
                        \Log::error("A problem as encountered,STK curl response was NOT saved!");

                        return false;
                    }
                }else{
                    return false;
                }
            }else{
                return false;
            }
        }else{
            return false;
        }
    }
    public function formatPhoneNumber($phone_no)
    {
        $prefix = substr($phone_no, 0, 2);

        if ($prefix == '07' || $prefix == '01') {

            if ($prefix == '07') {
                $str = $str = explode("7", $phone_no, 2);

                if (!empty($str[1])) {
                    if (strlen($str[1]) == 8) {
                        $recipient = "2547" . $str[1];
                        $resp = $recipient;
                    } else {
                        $resp = "Invalid"; //Invalid Phone number
                    }
                } else {
                    $resp = "Invalid"; //Invalid Phone number
                }
            } else {
                $str = $str = explode("1", $phone_no, 2);

                if (!empty($str[1])) {
                    if (strlen($str[1]) == 8) {
                        $recipient = "2541" . $str[1];
                        $resp = $recipient;
                    } else {
                        $resp = "Invalid"; //Invalid Phone number
                    }
                } else {
                    $resp = "Invalid"; //Invalid Phone number
                }
            }

        } else {
            $resp = "Invalid"; //Invalid Phone number
        }

        return $resp;
    }
}
