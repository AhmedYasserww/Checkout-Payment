import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_checkout/core/utils/api_keys.dart';
import 'package:payment_checkout/features/presentation/views/my_cart_view.dart';
import 'package:provider/provider.dart';
void main() {
  Stripe.publishableKey = ApiKeys.publishableKey;
  runApp(
    ChangeNotifierProvider(
      create: (context) => PaymentMethodProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCartView()
    );
  }
}



class PaymentMethodProvider extends ChangeNotifier {
  int _activeIndex = 0;

  int get activeIndex => _activeIndex;

  void setActiveIndex(int index) {
    _activeIndex = index;
    notifyListeners();
  }
}