import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:cv/features/product/data/model/product_cart_model.dart';
import 'package:cv/features/product/data/model/product_model.dart';
import 'package:cv/features/product/screens/function/product_functions.dart';

import '../../../../main.dart';
import '../../domain/usecase/products_use_case.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductsUseCase productsUseCase;

  ProductBloc({required this.productsUseCase}) : super(ProductInitial()) {
    on<ProductEvent>((event, emit) async {
      if (event is GetProductListEvent) {
        await sl<ProductFunctions>().getProductListData(
            event, emit, productsUseCase,
            isPagination: event.isPagination);
      }

      if (event is GetProductItemEvent) {
        await sl<ProductFunctions>()
            .getProductItemData(event, emit, productsUseCase);
      }

      if (event is GetProductCartCountEvent) {
        await sl<ProductFunctions>().getProductCartCountData(event, emit);
      }
    });
  }
}
