import 'package:flutter/material.dart';
import 'package:payment_checkout/core/utils/styles.dart';
class TotalPrice extends StatelessWidget {
  const TotalPrice({
    super.key, required this.total, required this.price,
  });
  final String total ;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(total,style: Styles.style24,),
        Text(price ,style: Styles.style24,),

      ],
    );
  }
}
