import 'package:flutter/material.dart';
import 'package:shopping_cart/models/details.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../models/product.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  //final productsRepository = ProductsRepository();
  //static const routeName = '/details';

  @override
  Widget build(BuildContext context) {
    final details = ModalRoute.of(context)!.settings.arguments as Product;
    String productImage = details.image ?? '';
    String productRate = details.rating?.rate ?? '0.0';
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Details'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Text(
                    details.title,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                ),

                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: 300.0,
                  height: 300.0,
                  child: FadeInImage.assetNetwork(
                      placeholder: 'product_placeholder.jpg',
                      image: productImage),
                ),
                //Image.network(details.image ?? ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RatingBarIndicator(
                      rating: double.parse(productRate),
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 14.0,
                      direction: Axis.horizontal,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(details.rating.toString()),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          details.price.toString() + ' \$',
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 35.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${(double.parse(details.price.toString()) * 2.815).toStringAsFixed(2)} р.',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                      ],
                    ),
                    ElevatedButton.icon(
                        style: ButtonStyle(
                            fixedSize:
                                MaterialStatePropertyAll(Size.fromWidth(150)),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.orangeAccent)),
                        onPressed: () {},
                        icon: Icon(Icons.add_shopping_cart_rounded),
                        label: Text('into cart')),
                  ],
                ),
                Padding(
                    padding:
                        EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Description',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          details.description ?? 'no description',
                          style: TextStyle(fontSize: 15.0),
                        ),
                      ],
                    )),
              ],
            ),
          ],
        ));
  }
}
