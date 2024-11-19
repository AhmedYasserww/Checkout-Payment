import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:payment_checkout/core/errors/failure.dart';
import 'package:payment_checkout/core/utils/stripe_service.dart';
import 'package:payment_checkout/features/data/models/payment_intent_input_model.dart';
import 'package:payment_checkout/features/data/repos/check_out_repo.dart';

class CheckOutRepoImp implements CheckOutRepo {
  final StripeService stripeService = StripeService();

  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return right(null);
    } on Exception catch (e) {
      if (e is DioException) {
        log('DioError occurred: ${e.message}');
        return left(ServerFailure.fromDioError(e));
      }
      log('Exception occurred: $e');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
