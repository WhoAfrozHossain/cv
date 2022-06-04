part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class GetProductListEvent extends ProductEvent {
  final String? nextUrl;
  final String? limit;
  final String? offset;
  final String? search;
  final bool isPagination;

  GetProductListEvent(
      {this.nextUrl,
      this.limit,
      this.offset,
      this.search,
      this.isPagination = false});

  @override
  List<Object?> get props => [nextUrl, limit, offset, search, isPagination];
}

class GetProductItemEvent extends ProductEvent {
  final String slug;

  GetProductItemEvent({required this.slug});

  @override
  List<Object?> get props => [slug];
}

class GetProductCartCountEvent extends ProductEvent {
  GetProductCartCountEvent();

  @override
  List<Object?> get props => [];
}
