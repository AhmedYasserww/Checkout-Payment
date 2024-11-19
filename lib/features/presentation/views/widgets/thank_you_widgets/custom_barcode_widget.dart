import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payment_checkout/core/utils/styles.dart';
class CustomBarcodeWidget extends StatelessWidget {
  const CustomBarcodeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(

      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(FontAwesomeIcons.barcode,size: 70,),
        Container(
          decoration:ShapeDecoration(shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 1.5,
              color: Color(0xff34A853),

            ),
            borderRadius: BorderRadius.circular(15),

          )),
          child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 29,vertical: 14),
            child: Text("PAID",textAlign: TextAlign.center,style: Styles.style24.copyWith(color: const Color(0xff34A853)),),
          ),
        )
      ],
    );
  }
}
