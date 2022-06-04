part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();
}

class ProductInitial extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductLoadingState extends ProductState {
  final bool? isPagination;

  ProductLoadingState({this.isPagination});

  @override
  List<Object?> get props => [isPagination];
}

class ProductsListSuccessState extends ProductState {
  final List<ProductModel> productsList;

  ProductsListSuccessState({required this.productsList});

  @override
  List<Object?> get props => [productsList];
}

class ProductItemSuccessState extends ProductState {
  final ProductModel? item;

  ProductItemSuccessState({required this.item});

  @override
  List<Object?> get props => [item];
}

class ProductsListErrorState extends ProductState {
  final String? message;

  ProductsListErrorState({this.message});

  @override
  List<Object?> get props => [message];
}

class ProductsListLastIndexState extends ProductState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class ProductCartCountState extends ProductState {
  final ProductCartModel? cartModel;

  ProductCartCountState({required this.cartModel});

  @override
  List<Object?> get props => [cartModel];
}
