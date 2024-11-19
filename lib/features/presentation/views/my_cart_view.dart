import 'package:flutter/material.dart';
import 'package:payment_checkout/core/utils/widgets/build_app_bar.dart';
import 'package:payment_checkout/features/presentation/views/widgets/my_card_view_widgets/my_cart_view_body.dart';
class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  buildAppBar(
          context: context
          ,title: "My Cart"
      ),
      body:const MyCartViewBody()
    );
  }
}
