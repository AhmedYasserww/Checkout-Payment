import 'package:flutter/material.dart';
import 'package:payment_checkout/features/presentation/views/payment_details_view.dart';
import 'package:payment_checkout/features/presentation/views/widgets/custom_button.dart';
import 'package:payment_checkout/features/presentation/views/widgets/payment_details_widgets/payment_method_list_view.dart';
class ShowMethodPaymentButtonSheet extends StatelessWidget {
  const ShowMethodPaymentButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16,),
          const PaymentMethodListView(),
          const SizedBox(height: 16,),
          CustomButton(
            text:"Continuo",
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return const PaymentDetailsView();
              }));
            },
          )
        ],
      ),
    );
  }
}
