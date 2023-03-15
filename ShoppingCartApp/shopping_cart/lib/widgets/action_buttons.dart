import 'package:flutter/material.dart';
import 'package:shopping_cart/bloc/product_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/bloc/product_event.dart';

class ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProductBloc productBloc = BlocProvider.of<ProductBloc>(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () {
            productBloc.add(ProductLoadEvent());
          },
          child: Text('Load products'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        ElevatedButton(
          onPressed: () {},
          child: Icon(
            IconData(0xe59c, fontFamily: 'MaterialIcons'),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
          ),
        ),
      ],
    );
  }
}
