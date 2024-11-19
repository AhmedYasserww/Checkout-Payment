import 'package:flutter/material.dart';
import 'package:payment_checkout/features/presentation/views/widgets/payment_details_widgets/payment_method_item.dart';
class PaymentMethodListView extends StatefulWidget {
  const PaymentMethodListView({super.key});

  @override
  State<PaymentMethodListView> createState() => _PaymentMethodListViewState();
}

class _PaymentMethodListViewState extends State<PaymentMethodListView> {
  int activeIndex =0;
  @override
  Widget build(BuildContext context) {
    final List<String> paymentImage = [
      "assets/images/card.svg",
      "assets/images/payPal.svg",
      "assets/images/pay.svg"
    ];
    return SizedBox(
      height:65 ,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount:paymentImage.length,
          itemBuilder: (context,i){
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GestureDetector(
            onTap: (){
              activeIndex = i ;
              setState(() {

              });
            },
            child: PaymentMethodItem(
              isActive: activeIndex==i,
                image: paymentImage[i]),
          ),
        );
      }),
    );
  }
}
