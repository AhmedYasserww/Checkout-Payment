import 'package:flutter/material.dart';
import 'package:payment_checkout/core/utils/styles.dart';
import 'package:payment_checkout/features/presentation/views/widgets/my_card_view_widgets/total_price_widget.dart';
import 'package:payment_checkout/features/presentation/views/widgets/thank_you_widgets/custom_barcode_widget.dart';
import 'package:payment_checkout/features/presentation/views/widgets/thank_you_widgets/master_card_info.dart';
import 'package:payment_checkout/features/presentation/views/widgets/thank_you_widgets/payment_item_info.dart';
class ThankYouCard extends StatelessWidget {
  const ThankYouCard({super.key,});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xffEDEDED),
        borderRadius: BorderRadius.circular(20),
      ),
child: Padding(
  padding: const EdgeInsets.only(top: 50 +16,left: 22,right: 22),
  child: Column(
    children: [
Text("Thank You!",style: Styles.style25,),

      Text("Your transaction was successful",style: Styles.style20,),
      const SizedBox(height: 42,),
      const PaymentItemInfo(
        title: "Date",
        value: "01/24/2023",
      ),
      const PaymentItemInfo(
        title: "Time",
        value: "10:15 AM",
      ),
      const PaymentItemInfo(
        title: "To",
        value: "Sam Louis",
      ),
const SizedBox(height: 10,),
      const Divider(
        color: Color(0xffC7C7C7),
        thickness: 3,
      ),
      const SizedBox(height: 24,),
      const TotalPrice(total: "Total", price: "\$50.97"),
      const SizedBox(height: 30,),
  const MasterCardInfo(),
const Spacer(),
      const CustomBarcodeWidget(),
      SizedBox(height: ((MediaQuery.sizeOf(context).height*.16+20)/2)-35
      )
    ],
  ),
),
    );
  }
}


