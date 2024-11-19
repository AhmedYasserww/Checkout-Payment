import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,  this.isActive = false, required this.image,
  });
final bool isActive;
final String image ;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      child: Container(
        width: 100,
        height: 62,
        decoration: ShapeDecoration(
            shadows: [
              BoxShadow(
                blurRadius: 4,
                  color:isActive? const Color(0xff34A853):Colors.white
              )
            ],
            shape:RoundedRectangleBorder(
                side:  BorderSide(width: 1.5,color:isActive? const Color(0xff34A853):const Color(0xff80887c)),
                borderRadius: BorderRadius.circular(15)
            )
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15)
      
          ),
          child: Center(child: SvgPicture.asset(image)),
        ),
      
      ),
    );
  }
}
