import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_checkout/features/data/models/payment_intent_input_model.dart';
import 'package:payment_checkout/features/presentation/manager/payment_cubit.dart';
import 'package:payment_checkout/features/presentation/views/thank_you_view.dart';
import 'package:payment_checkout/features/presentation/views/widgets/custom_button.dart';
class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit,PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
            return const ThankYouView();
          }));
        }
        if (state is PaymentFailure) {
          Navigator.of(context).pop();
          final snackBar = SnackBar(content: Text(state.errorMessage));
           ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context,state) {
        return CustomButton(
          isLoading: state is PaymentLoading?true :false,
          text:"Continue",
          onTap: (){
            PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(amount: "200", currency: "USD",customerId: "cus_RLUcTNJa3u4joD");
            BlocProvider.of<PaymentCubit>(context).makePayment(paymentIntentInputModel: paymentIntentInputModel);

          },
        );
      }
    );
  }
}
