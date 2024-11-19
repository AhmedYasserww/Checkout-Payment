import 'package:flutter/material.dart';
import 'package:payment_checkout/core/utils/styles.dart';
class PaymentItemInfo extends StatelessWidget {
  const PaymentItemInfo({super.key, required this.title, required this.value});
  final String title , value ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: Styles.style18,),
          Text(value,style: Styles.style18semiBold,)
        ],
      ),
    );
  }
}
