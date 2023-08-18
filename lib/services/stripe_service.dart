import 'dart:convert';

import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:stripe_app/models/stripe_custom_response.dart';

import 'package:http/http.dart' as http;

class StripeService {
  StripeService._privateConstructor();
  static final StripeService _instance = StripeService._privateConstructor();
  factory StripeService() => _instance;

  static const String _paymentApiUrl =
      'https://api.stripe.com/v1/payment_intents';
  static const String _secretKey =
      'sk_test_51NcU9hAmz9VdMTRDkTzMKg3hi55R2G0wSTisUgxvNwAWTAd3QZj9mnsxSkODkNoXnLj7oPoczcPKUbNYfCQlgeET00R2BaAMSU';

  static String _apiKey =
      'pk_test_51NcU9hAmz9VdMTRD8AZraIfcDxmavo0YOqhsuAZmHovDeljBLFEaqUHxdGsevpIKUvT1KEkjYtuZDTrFQZd3bcwY004M1ZJrFQ';
  void init() {
    Stripe.publishableKey = _apiKey;
    Stripe.merchantIdentifier = 'test';
  }

  Future payWithExistingCard({
    required String amount,
    required String currency,
    required Card card,
  }) async {}

  Future<StripeCustomResponse> payWithNewCard({
    required String amount,
    required String currency,
  }) async {
    try {
      final stripe = Stripe.instance;
      stripe.initPaymentSheet(
        paymentSheetParameters: const SetupPaymentSheetParameters(
          merchantDisplayName: 'Test',
        ),
      );
      await stripe.presentPaymentSheet();

      return StripeCustomResponse(ok: true);
    } catch (e) {
      return StripeCustomResponse(ok: false, msg: e.toString());
    }
  }

  Future payWithAppleOrGoogle({
    required String amount,
    required String currency,
  }) async {}

  Future _createPaymentIntent({
    required String amount,
    required String currency,
  }) async {
    try {
      //Request body
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
      };

      //Make post request to Stripe
      var response = await http.post(
        Uri.parse(_paymentApiUrl),
        headers: {
          'Authorization': 'Bearer $_secretKey',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      return json.decode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  Future _makePayment(
      {required String amount,
      required String currency,
      required PaymentMethod paymentMethod}) async {}
}
