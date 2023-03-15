import 'package:flutter/material.dart';
import 'package:market_cart/bloc/product_bloc.dart';
import 'package:market_cart/services/product_repository.dart';
import 'package:market_cart/widgets/action_buttons.dart';
import 'package:market_cart/widgets/product_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  final productsRepository = ProductsRepository();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductBloc>(
      create: (context) => ProductBloc(productsRepository: productsRepository),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Product List'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ActionButtons(),
            Expanded(child: ProductList()),
          ],
        ),
      ),
    );
  }
}
