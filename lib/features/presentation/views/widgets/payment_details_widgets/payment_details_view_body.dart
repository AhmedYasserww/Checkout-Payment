
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:payment_checkout/features/presentation/views/thank_you_view.dart';
import 'package:payment_checkout/features/presentation/views/widgets/custom_button.dart';
import 'package:payment_checkout/features/presentation/views/widgets/payment_details_widgets/custom_credit_card.dart';
import 'package:payment_checkout/features/presentation/views/widgets/payment_details_widgets/payment_method_list_view.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  final GlobalKey<FormState>formKey = GlobalKey();
   AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: CustomScrollView(
        slivers:
       [
          const SliverToBoxAdapter(child: PaymentMethodListView()),
          SliverToBoxAdapter(child: CustomCreditCard(formKey: formKey,autovalidateMode: autovalidateMode,)),
          SliverFillRemaining(
           hasScrollBody: false,
           child: Align(
             alignment: Alignment.bottomCenter,
               child: CustomButton(
                 onTap: (){
                  if(formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                      log("Payment");
                  }
                  else{
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return const ThankYouView();
                    }));
                    autovalidateMode =AutovalidateMode.always;
                    setState(() {

                    });
                  }
                 },
                   text: "Payment")),
         ),
         const SliverToBoxAdapter(child: SizedBox(height: 16,))

        ],
      ),
    );
  }
}

