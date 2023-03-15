import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopping_cart/models/product.dart';

class ProductProvider {
  // https://jsonplaceholder.typicode.com/users

  Future<List<Product>> getProducts() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      final List<dynamic> productJson = json.decode(response.body);
      return productJson.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching products');
    }
  }
}
