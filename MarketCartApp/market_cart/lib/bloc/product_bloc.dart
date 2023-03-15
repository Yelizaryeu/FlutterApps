import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_cart/bloc/product_event.dart';
import 'package:market_cart/bloc/product_state.dart';
import 'package:market_cart/models/product.dart';
import 'package:market_cart/services/product_repository.dart';

class ProductBloc extends Bloc<ProdcutEvent, ProductState> {
  final ProductsRepository productsRepository;
  ProductBloc({required this.productsRepository}) : super(ProductEmptyState()) {
    on<ProductLoadEvent>((event, emit) async {
      emit(ProductLoadingState());

      try {
        final List<Product> loadedProductList =
            await productsRepository.getAllProduct();
        log('got all products');
        emit(ProductLoadedState(loadedProduct: loadedProductList));
      } catch (_) {
        log('can not load products');
        emit(ProductErrorState());
      }
    });
    on<ProductSelectEvent>(((event, emit) async {
      emit(ProductSelectState());
    }));
  }
}
