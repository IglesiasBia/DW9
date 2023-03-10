import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dw9_delivery_app/app/pages/home/home_state.dart';
import 'package:dw9_delivery_app/app/repositories/products/products_repository.dart';

class HomeController extends Cubit<HomeState> {
  final ProductsRepository _productsRepository;
  HomeController(
    this._productsRepository,
  ) : super(
          const HomeState.initial(),
        );

  Future<void> loadProducts() async {
    emit(
      state.copyWith(status: HomeStateStatus.loading),
    );
    try {
      final products = await _productsRepository.findAllProducts();
      // throw Exception();
      emit(state.copyWith(status: HomeStateStatus.loaded, products: products));
    } on Exception catch (e, s) {
      log("Erro ao buscar produtos", error: e, stackTrace: s);
      emit(state.copyWith(
        status: HomeStateStatus.error,
        errorMessage: "Erro ao buscar produtos",
      ));
    }
  }
}
