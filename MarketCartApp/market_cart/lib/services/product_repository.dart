import 'package:market_cart/models/product.dart';
import 'package:market_cart/services/product_api_provider.dart';

class ProductsRepository {
  ProductProvider _productProvider = ProductProvider();
  Future<List<Product>> getAllProduct() => _productProvider.getProducts();
}
