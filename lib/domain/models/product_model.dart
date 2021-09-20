class ProductModel {
  final int id;
  final String name;
  final double price;
  final String description;
  final String imageUrl;
  final String category;
  int quantity;

  ProductModel({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.description,
    required this.category,
    this.quantity = 1,
  });
}
