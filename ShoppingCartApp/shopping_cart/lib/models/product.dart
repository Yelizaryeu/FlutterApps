// TODO: implement json_serializaable like here https://docs.flutter.dev/development/data-and-backend/json

class Product {
  int id;
  String title;
  String? price;
  String? category;
  String? description;
  Rating? rating;
  String? image;

  Product({
    required this.id,
    required this.title,
    this.price,
    this.category,
    this.description,
    this.rating,
    this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    //final image = json['image'] as String?;
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'].toString(),
      category: json['category'],
      description: json['description'],
      image: json['image'],
      rating:
          json['rating'] != null ? new Rating.fromJson(json['rating']) : null,
      //image: image != null ? Uri.tryParse(image) : null,
    );
  }
}

class Rating {
  String? rate;
  int? count;

  Rating({this.count, this.rate});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: json['rate'].toString(),
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    data['count'] = this.count;
    return data;
  }

  @override
  String toString() {
    // TODO: implement toString
    return ('${this.rate}  (${this.count})').toString();
  }
}
