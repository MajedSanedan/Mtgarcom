class ProductModel {
  final String name;
  final String imageUrl;
  final double price;
  int count;

  ProductModel(
      {required this.name,
      required this.imageUrl,
      required this.price,
      this.count = 0});
}
