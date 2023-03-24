import 'package:shopping_cart/models/product.dart';

class ProductDetails {
  int id;
  String title;
  String? price;
  String? category;
  String? description;
  Rating? rating;
  String? image;

  ProductDetails({
    required this.id,
    required this.title,
    this.price,
    this.category,
    this.description,
    this.rating,
    this.image,
  });
}
