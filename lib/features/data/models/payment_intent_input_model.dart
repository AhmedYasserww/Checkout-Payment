class PaymentIntentInputModel {
  final String amount;
  final String currency;
  final  String ? customerId;

  PaymentIntentInputModel({
    required this.amount,
    required this.currency,
     this.customerId
  });

  Map<String, dynamic> toJson() {
    final calculatedAmount = (double.parse(amount) * 100).toInt().toString();

    return {
      'amount': calculatedAmount,
      'currency': currency,
      'customer': customerId,

    };
  }
}
