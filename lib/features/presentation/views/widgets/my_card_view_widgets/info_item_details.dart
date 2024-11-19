import 'package:flutter/material.dart';
import 'package:payment_checkout/features/presentation/views/widgets/my_card_view_widgets/order_info_item.dart';
class InfoItemDetails extends StatelessWidget {
  const InfoItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        OrderInfoItem(title: "Order Subtotal",value: "\$42.97",),
        SizedBox(height: 3,),
        OrderInfoItem(title: "Discount",value: "\$0",),
        SizedBox(height: 3,),
        OrderInfoItem(title: "Shipping",value: "\$8",),
      ],
    );
  }
}
