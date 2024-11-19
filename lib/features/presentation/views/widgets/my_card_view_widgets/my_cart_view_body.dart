import 'package:flutter/material.dart';
import 'package:payment_checkout/features/presentation/views/widgets/custom_button.dart';
import 'package:payment_checkout/features/presentation/views/widgets/my_card_view_widgets/info_item_details.dart';
import 'package:payment_checkout/features/presentation/views/widgets/my_card_view_widgets/show_method_payment_button_sheet.dart';
import 'package:payment_checkout/features/presentation/views/widgets/my_card_view_widgets/total_price_widget.dart';
class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
       const SizedBox(height: 18,),
        Expanded(child: Image.asset("assets/images/basket_image.png")),
        const SizedBox(height: 25,),
        const InfoItemDetails(),
        const Divider(
          color: Color(0xffC7C7C7),
          thickness: 2,
          height: 34,
        ),
        const TotalPrice(total: "Total",price:"\$50.97",),
        const SizedBox(height: 20,),
        CustomButton(text: "Complete Payment",
          onTap: ()
          {
            showModalBottomSheet(context: context, builder: (context){
              return const ShowMethodPaymentButtonSheet();
            });
            },
        ),
        const SizedBox(height: 16),

      ],
      ),
    );
  }
}



