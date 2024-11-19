import 'package:flutter/material.dart';
import 'package:payment_checkout/core/utils/widgets/build_app_bar.dart';
import 'package:payment_checkout/features/presentation/views/widgets/thank_you_widgets/thank_you_view_body.dart';
class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context
      ),
      body: Transform.translate(
        offset: const Offset(0, -25),
          child: const ThankYouViewBody()
      ),
    );
  }
}