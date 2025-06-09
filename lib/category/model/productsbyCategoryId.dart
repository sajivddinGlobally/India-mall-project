class ProductByCategoryID {
  final int id;
  final String name;
  final String price;
  final String regularPrice;
  final String salePrice;
  final String image;
  final String permalink;

  ProductByCategoryID({
    required this.id,
    required this.name,
    required this.price,
    required this.regularPrice,
    required this.salePrice,
    required this.image,
    required this.permalink,
  });

  factory ProductByCategoryID.fromJson(Map<String, dynamic> json) {
    return ProductByCategoryID(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      regularPrice: json['regular_price'],
      salePrice: json['sale_price'],
      image: json['image'],
      permalink: json['permalink'],
    );
  }
}
