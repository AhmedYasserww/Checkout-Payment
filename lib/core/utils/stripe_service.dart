import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_checkout/core/utils/api_keys.dart';
import 'package:payment_checkout/core/utils/api_service.dart';
import 'package:payment_checkout/features/data/models/EphemeralKeyModel.dart';
import 'package:payment_checkout/features/data/models/PaymentIntentModel.dart';
import 'package:payment_checkout/features/data/models/initPaymentSheetInputModel.dart';
import 'package:payment_checkout/features/data/models/payment_intent_input_model.dart';
import 'package:payment_checkout/features/presentation/views/widgets/my_card_view_widgets/CustomerDataModel.dart';

class StripeService {
  final ApiService apiService = ApiService(dio: Dio());

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
      url: "https://api.stripe.com/v1/payment_intents",
      data: paymentIntentInputModel.toJson(),
      contentType: "application/x-www-form-urlencoded",
      token: ApiKeys.secretKey,
    );
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future initPaymentSheet(
      {required InitPaymentSheetInputModel initPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        merchantDisplayName: 'Ahmed Yasser',
        paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,
        customerEphemeralKeySecret: initPaymentSheetInputModel
            .ephemeralKeySecret,
        customerId: initPaymentSheetInputModel.customerId,
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralKeyModel = await createEphemeralKey(
        customerId: paymentIntentInputModel.customerId!);
    var initPaymentSheetInputModel = InitPaymentSheetInputModel(
      clientSecret: paymentIntentModel.clientSecret!,
      ephemeralKeySecret: ephemeralKeyModel.secret!,
      customerId: paymentIntentInputModel.customerId,
    );
    await initPaymentSheet(
        initPaymentSheetInputModel: initPaymentSheetInputModel);
    await displayPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    var response = await apiService.post(
      url: "https://api.stripe.com/v1/ephemeral_keys",
      data: {
        "customer": customerId,
      },
      token: ApiKeys.secretKey,
      contentType: "application/x-www-form-urlencoded",
      headers: {
        "Stripe-Version": "2024-10-28.acacia",
        'Authorization': 'Bearer ${ApiKeys.secretKey}'
      },
    );
    var ephemeralKeyModel = EphemeralKeyModel.fromJson(response.data);
    return ephemeralKeyModel;
  }

  Future<CustomerDataModel> createCustomer(
      CustomerDataModel customerDataModel) async {
    var response = await apiService.post(
      url: "https://api.stripe.com/v1/customers",
      data: customerDataModel.toJson(),
      contentType: "application/x-www-form-urlencoded",
      token: ApiKeys.secretKey,
    );

    log("Customer Response: ${response.data}");

    var customerDataModell = CustomerDataModel.fromJson(response.data);

    return customerDataModell;
  }
}