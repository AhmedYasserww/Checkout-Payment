import 'package:flutter/material.dart';
import 'package:payment_checkout/features/presentation/views/widgets/payment_details_widgets/payment_method_item.dart';
import 'package:payment_checkout/main.dart';
import 'package:provider/provider.dart';

class PaymentMethodListView extends StatelessWidget {
  const PaymentMethodListView({super.key});

  @override
  Widget build(BuildContext context) {
    final paymentImage = [
      "assets/images/card.svg",
      "assets/images/payPal.svg",
    ];

    final provider = Provider.of<PaymentMethodProvider>(context);

    return SizedBox(
      height: 65,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: paymentImage.length,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () => provider.setActiveIndex(i),
              child: PaymentMethodItem(
                isActive: provider.activeIndex == i,
                image: paymentImage[i],
              ),
            ),
          );
        },
      ),
    );
  }
}
