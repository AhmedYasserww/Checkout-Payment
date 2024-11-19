import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment_checkout/core/utils/styles.dart';
class MasterCardInfo extends StatelessWidget {
  const MasterCardInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
        child: Row(
          children: [
            SvgPicture.asset("assets/images/master_card.svg"),
            const SizedBox(width: 23),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("CreditCard", style: Styles.style18),
                Text(
                  "Mastercard **78",
                  style: Styles.style18.copyWith(color: Colors.black.withOpacity(.7)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
