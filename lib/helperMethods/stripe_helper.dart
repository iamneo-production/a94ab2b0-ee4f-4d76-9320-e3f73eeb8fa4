import 'dart:convert';

import 'package:dotpay/helperMethods/http_helper.dart';
import 'package:dotpay/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class StripeHelper {
  Map<String, dynamic>? paymentIntentData;
  Future<void> makePayment(int amount, BuildContext context) async {
    paymentIntentData = await createPaymentIntent(amount.toString(), "INR");
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: paymentIntentData!['client_secret'],
            googlePay: const PaymentSheetGooglePay(
              testEnv: true,
              merchantCountryCode: 'IN',
              currencyCode: 'INR',
            ),
            // applePay: true,

            merchantDisplayName: "Kartikey"));

    displayPaymentSheet(context);
  }

  void showSnackbar(String title, BuildContext context) {
    final snackBar = SnackBar(
      content: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  displayPaymentSheet(BuildContext context) async {
    await Stripe.instance.presentPaymentSheet(
      parameters: PresentPaymentSheetParameters(
        clientSecret: paymentIntentData!['client_secret'],
        confirmPayment: true,
      ),
    );

    paymentIntentData = null;

    showSnackbar('Paid successfully', context);
  }

  createPaymentIntent(String amount, String currency) async {
    Map<String, dynamic> body = {
      "amount": calculateAmount(amount),
      "currency": currency,
      "payment_method_types[]": "card"
    };

    var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        body: body,
        headers: {
          'Authorization':
              'Bearer sk_test_51KKZqCSDWrglFC7UJCcz8MwSxpx3EFyT61xEwbrNURgwo4of9zT6wf0Qb2eytq4v9WZej2ZAF8QlgjNG5awvdPiw00MshsfnNg',
          'Content-Type': 'application/x-www-form-urlencoded'
        });
    //  uploadPayment(accountNo, name, amt, transactionType, label)
    var res = jsonDecode(response.body.toString());

    return res;
  }

  calculateAmount(String amount) {
    final price = int.parse(amount) * 100;
    return price.toString();
  }

  uploadPayment(int accountNo, String name, int amt,
      List<String> transactionType, String label) async {
    String url =
        "https://tokenbalance-production.up.railway.app/api/transaction/";
    final res = await HttpHelper.postRequest(url, {}, {
      "_acctn": accountNo,
      "name": name,
      "Amt": 60,
      "transaction_type": transactionType,
      "label_type": label
    });
  }

  static Future<List<TransactionModel>> getTransactionList(
      int accountNo) async {
    String url =
        "https://tokenbalance-production.up.railway.app/api/transaction/$accountNo";
    final res = await HttpHelper.getRequest(url);
    final resp = jsonDecode(res.body);
    List<TransactionModel> transactions = [];
    for (var data in resp as List) {
      TransactionModel transactionModel = TransactionModel.fromMap(data);
      transactions.add(transactionModel);
    }
    return transactions;
  }

  getUserToken(int accountNo) {
    String url =
        "https://tokenbalance-production.up.railway.app/api/token/$accountNo";
  }
}
