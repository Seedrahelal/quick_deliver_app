class OrderModel {
  final String productName;
  final double productPrice;
  final int quantity;
  final double totalPrice;

  OrderModel({
    required this.productName,
    required this.productPrice,
    required this.quantity,
    required this.totalPrice,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      productName: json['product_name'],
      productPrice: double.parse(json['product_price'].toString()),
      quantity: json['quantity'],
      totalPrice: double.parse(json['total_price'].toString()),
    );
  }
}
