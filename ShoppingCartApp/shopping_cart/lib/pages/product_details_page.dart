import 'package:flutter/material.dart';
import 'package:shopping_cart/models/details.dart';

import '../models/product.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  //final productsRepository = ProductsRepository();
  //static const routeName = '/details';

  @override
  Widget build(BuildContext context) {
    final details = ModalRoute.of(context)!.settings.arguments as Product;
    String productImage = details.image ?? '';
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Details'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FadeInImage.assetNetwork(
                    placeholder: 'product_placeholder.jpg',
                    image: productImage),
                //Image.network(details.image ?? ),
                Text(details.title),
                Text(details.price.toString() + '\$'),
                Text(details.category ?? 'No category'),
                Text(details.rating.toString()),
                Text(details.description ?? 'No description'),
              ],
            ),
          ],
        ));
  }
}
