class ProductModels {
  final int id;
  final String name;
  final String description;
  final int price;
  final int stockQuantity;
  final String productPicture;
  final int storeId;

  ProductModels({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stockQuantity,
    required this.productPicture,
    required this.storeId,
  });

  factory ProductModels.fromJson(Map<String, dynamic> json) {
    return ProductModels(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      stockQuantity: json['stock_quantity'],
      productPicture: json['product_picture'],
      storeId: json['store_id'],
    );
  }
}
