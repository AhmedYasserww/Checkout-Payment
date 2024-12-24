class InvoiceSettings {
  InvoiceSettings({
      this.customFields, 
      this.defaultPaymentMethod, 
      this.footer,
    this.renderingOptions,
      });

  InvoiceSettings.fromJson(dynamic json) {
    customFields = json['custom_fields'];
    defaultPaymentMethod = json['default_payment_method'];
    footer = json['footer'];
    renderingOptions = json['rendering_options'];
  }
  dynamic customFields;
  dynamic defaultPaymentMethod;
  dynamic footer;
  dynamic renderingOptions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['custom_fields'] = customFields;
    map['default_payment_method'] = defaultPaymentMethod;
    map['footer'] = footer;
    map['rendering_options'] = renderingOptions;
    return map;
  }

}