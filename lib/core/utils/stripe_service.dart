import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_checkout/core/utils/api_keys.dart';
import 'package:payment_checkout/core/utils/api_service.dart';
import 'package:payment_checkout/features/data/models/PaymentIntentModel.dart';
import 'package:payment_checkout/features/data/models/payment_intent_input_model.dart';
class StripeService{
  final ApiService apiService = ApiService(dio: Dio());

  Future<PaymentIntentModel> createPaymentIntent(PaymentIntentInputModel paymentIntentInputModel)async {
   var response = await apiService.post(

        url: "https://api.stripe.com/v1/payment_intents",
        data: paymentIntentInputModel.toJson(),
        contentType: "application/x-www-form-urlencoded",
        token: ApiKeys.secretKey
    );
   var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
   return paymentIntentModel;
  }

  Future initPaymentSheet({required String paymentIntentClientSecret})async{
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
        merchantDisplayName: 'Ahmed Yasser',
        paymentIntentClientSecret:paymentIntentClientSecret,

    ));
  }

Future displayPaymentSheet()async {
  await Stripe.instance.presentPaymentSheet();
}

Future makePayment({required PaymentIntentInputModel paymentIntentInputModel})async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    await initPaymentSheet(paymentIntentClientSecret: paymentIntentModel.clientSecret!);
  await displayPaymentSheet();
}
}