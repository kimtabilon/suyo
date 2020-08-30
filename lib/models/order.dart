class Order {

  final String orderId;

  final String merchantId;
  final String merchantName;
  final String merchantAddress;

  final String clientId;
  final String clientName;
  final String clientAddress;
  final String clientAddressId;

  final String transactionNumber;
  final String promoCode;
  final String promoId;

  final String promoAmount;
  final String shippingFee;
  final String shoppingFee;
  final String itemTotalAmount;
  final String subTotalAmount;
  final String tax;
  final String totalAmount;

  final String queue;

  Order({
    this.orderId,

    this.merchantId,
    this.merchantName,
    this.merchantAddress,

    this.clientId,
    this.clientName,
    this.clientAddress,
    this.clientAddressId,

    this.transactionNumber,
    this.promoCode,
    this.promoId,

    this.promoAmount,
    this.shippingFee,
    this.shoppingFee,
    this.itemTotalAmount,
    this.subTotalAmount,
    this.tax,
    this.totalAmount,

    this.queue,
  });
}

class OrderItem {
  final String orderId;
  final String productId;
  final String name;
  final String price;
  final String qty;

  OrderItem({
    this.orderId,
    this.productId,
    this.name,
    this.price,
    this.qty,
  });
}