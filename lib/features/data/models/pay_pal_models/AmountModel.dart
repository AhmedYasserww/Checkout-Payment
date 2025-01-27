import 'Details.dart';

class AmountModel {
  final String total;
  final String currency;
  final Details? details;

  AmountModel({
    required this.total,
    required this.currency,
    this.details,
  });

  factory AmountModel.fromJson(Map<String, dynamic> json) {
    return AmountModel(
      total: json['total'] as String,
      currency: json['currency'] as String,
      details: json['details'] != null ? Details.fromJson(json['details']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = total;
    map['currency'] = currency;
    if (details != null) {
      map['details'] = details?.toJson();
    }
    return map;
  }
}
