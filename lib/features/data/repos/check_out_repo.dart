import 'package:dartz/dartz.dart';
import 'package:payment_checkout/core/errors/failure.dart';
import 'package:payment_checkout/features/data/models/payment_intent_input_model.dart';

abstract class CheckOutRepo {
Future <Either<Failure,void>>makePayment({required PaymentIntentInputModel paymentIntentInputModel});
}