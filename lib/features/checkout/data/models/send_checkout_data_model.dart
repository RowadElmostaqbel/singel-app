class SendCheckoutDataModel {
  String? clientId;
  String? phone;
  String? orderType;
  String? clientAdrressId;
  String? paymentMethod;
  String? couponId;

  SendCheckoutDataModel({
     this.clientId,
     this.phone,
     this.orderType,
     this.clientAdrressId,
     this.paymentMethod,
     this.couponId,
  });

  toJson() {
    return {
      'client_id': clientId,
      'phone': phone,
      'order_type': orderType,
      'client_address_id': clientAdrressId,
      'payment_method': paymentMethod,
      'coupon_id': couponId,
    };
  }
}
