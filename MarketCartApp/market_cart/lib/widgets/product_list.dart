// ignore_for_file: prefer_const_literals_to_create_immutables
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:market_cart/bloc/product_bloc.dart';
import 'package:market_cart/bloc/product_state.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductBloc, ProductState>(
      listener: ((context, state) {
        log(state.toString());
        if (state is ProductLoadedState) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Products are Loaded')));
        }
      }),
      builder: (context, state) {
        if (state is ProductEmptyState) {
          return Center(
            child: Text(
              'no data recieved, press load button',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          );
        }
        if (state is ProductLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ProductLoadedState) {
          return ListView.builder(
              itemCount: state.loadedProduct.length,
              itemBuilder: (context, index) => Container(
                    color: index % 2 == 0 ? Colors.white : Colors.green[10],
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: SizedBox(
                          width: 100.0,
                          height: 100.0,
                          child:
                              Image.network(state.loadedProduct[index].image),
                        ),
                        /* Text(
                  'ID: ${state.loadedProduct[index].id}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),*/
                        title: Column(
                          children: [
                            Text(
                              '${state.loadedProduct[index].title}',
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Price: ${state.loadedProduct[index].price}\$',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                                RatingBarIndicator(
                                  rating: double.parse(
                                      state.loadedProduct[index].rating.rate),
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  itemCount: 5,
                                  itemSize: 14.0,
                                  direction: Axis.horizontal,
                                ),
                                Text(
                                  '${state.loadedProduct[index].rating.toString()}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ));
        }
        if (state is ProductErrorState) {
          return Center(
            child: Text(
              'no data recieved, try again',
              style: TextStyle(fontSize: 20.0),
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
