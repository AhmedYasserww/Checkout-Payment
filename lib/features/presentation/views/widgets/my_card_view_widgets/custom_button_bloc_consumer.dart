import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment_checkout/core/utils/api_keys.dart';
import 'package:payment_checkout/features/data/models/pay_pal_models/AmountModel.dart';
import 'package:payment_checkout/features/data/models/pay_pal_models/Details.dart';
import 'package:payment_checkout/features/data/models/pay_pal_models/ItemListModel.dart';
import 'package:payment_checkout/features/data/models/pay_pal_models/Items.dart';
import 'package:payment_checkout/features/presentation/manager/payment_cubit.dart';
import 'package:payment_checkout/features/presentation/views/thank_you_view.dart';
import 'package:payment_checkout/features/presentation/views/widgets/custom_button.dart';
class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit,PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
            return const ThankYouView();
          }));
        }
        if (state is PaymentFailure) {
          Navigator.of(context).pop();
          final snackBar = SnackBar(content: Text(state.errorMessage));
           ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context,state) {
        return CustomButton(
          isLoading: state is PaymentLoading?true :false,
          text:"Continue",
          onTap: (){
            // PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(amount: "200", currency: "USD",customerId: "cus_RLUcTNJa3u4joD");
            // BlocProvider.of<PaymentCubit>(context).makePayment(paymentIntentInputModel: paymentIntentInputModel);
          var transactionData = getTransactionData();
          executePayPalPayment(context, transactionData);

          },
        );
      }
    );

  }

  void executePayPalPayment(BuildContext context, ({AmountModel amount, ItemListModel itemList}) transactionData) {
     Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,// live or test   =>true = live
        clientId: ApiKeys.clientIDPaypal,
        secretKey: ApiKeys.secretKeyPaypal,
        transactions:  [
          {
            "amount": transactionData.amount.toJson(),
            "description": "The payment transaction description.",
            "item_list": transactionData.itemList.toJson(),
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("************************************");
          log("onSuccess: $params");
          Navigator.pop(context);
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          log('cancelled:');
          Navigator.pop(context);
        },
      ),
    ));
  }
  ({AmountModel amount,ItemListModel itemList})getTransactionData(){
    var amount = AmountModel(
      currency: "USD",
      details: Details(
          shipping: "0",
          subtotal: "120",
          shippingDiscount: 0
      ),
      total: "120",
    );
    List<OrderItem>orders = [
      OrderItem(
        currency: "USD",
        name: "Apple",
        quantity: 6,
        price: '10',),
      OrderItem(
        currency: "USD",
        name: "Pineapple",
        quantity: 5,
        price: '12',),


    ];
    var itemList = ItemListModel(
      orders: orders,
    );
    return (amount :amount,itemList:itemList);
  }
}
