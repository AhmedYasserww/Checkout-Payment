import 'package:flutter/material.dart';
import 'package:payment_checkout/features/presentation/views/widgets/my_card_view_widgets/custom_button_bloc_consumer.dart';
import 'package:payment_checkout/features/presentation/views/widgets/payment_details_widgets/payment_method_list_view.dart';
class ShowMethodPaymentButtonSheet extends StatelessWidget {
  const ShowMethodPaymentButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
           SizedBox(height: 16,),
           PaymentMethodListView(),
           SizedBox(height: 16,),
          CustomButtonBlocConsumer()
        ],
      ),
    );
  }
}

