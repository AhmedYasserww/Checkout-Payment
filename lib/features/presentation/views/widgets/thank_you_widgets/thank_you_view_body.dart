import 'package:flutter/material.dart';
import 'package:payment_checkout/features/presentation/views/widgets/thank_you_widgets/custom_check_item.dart';
import 'package:payment_checkout/features/presentation/views/widgets/thank_you_widgets/custom_dashed_line.dart';
import 'package:payment_checkout/features/presentation/views/widgets/thank_you_widgets/thank_you_card.dart';
class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 20,right: 20,left: 20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const ThankYouCard(),
          Positioned(
            left: -20,
            bottom: MediaQuery.sizeOf(context).height *.16,
              child: const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,

          )),
          Positioned(
              right: -20,
              bottom: MediaQuery.sizeOf(context).height *.16,
              child: const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,

              )),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height *.16+20 ,
            left: 20+16,
            right: 20+16,
            child: const CustomDashedLine(),
          ),
          const Positioned(
            top: -50,
            left: 0,
            right: 0,
            child:  CustomCheckItem(),
          )
        ],
      ),
    );
  }
}




/*class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xffB8B8B8)
      ..strokeWidth = 3;

    double dashWidth = 4;
    double dashSpace = 4;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
*/