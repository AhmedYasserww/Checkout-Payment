import 'package:flutter/material.dart';
import 'package:payment_checkout/core/utils/widgets/build_app_bar.dart';
import 'package:payment_checkout/features/presentation/views/widgets/payment_details_widgets/payment_details_view_body.dart';
class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context: context
            ,title: "Payment Details"
    ),
      body: const PaymentDetailsViewBody(),
    );
  }
}
