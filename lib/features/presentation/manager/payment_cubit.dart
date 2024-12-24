import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:payment_checkout/features/data/models/payment_intent_input_model.dart';
import 'package:payment_checkout/features/data/repos/check_out_repo.dart';
part 'payment_state.dart';
class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkOutRepo) : super(PaymentInitial());
  final CheckOutRepo checkOutRepo;

  Future<void> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(PaymentLoading());
    try {
      var result = await checkOutRepo.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      result.fold(
              (failure) {
            emit(PaymentFailure(errorMessage: failure.errorMessage));
          },
            (success){
          emit(PaymentSuccess());
      }
      );
    }  catch (e) {
      log('Exception occurred: $e');
      emit(PaymentFailure(errorMessage: e.toString()));

    }
}
@override
  void onChange(Change<PaymentState> change) {
    log('**********************************');
    log('onChange: ${change.toString()}');
    log('**********************************');
    super.onChange(change);
  }
}
