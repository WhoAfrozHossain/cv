import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:cv/core/apphelper/appResponse/app_api_response.dart';
import 'package:cv/core/apphelper/appResponse/model/model.dart';
import 'package:cv/core/error/failures.dart';
import 'package:cv/core/usecase/use_case.dart';
import 'package:cv/features/product/domain/repository/products_repository.dart';

class ProductsUseCase extends UseCase<AppApiResponse, Prams> {
  final ProductsRepository productsRepository;

  ProductsUseCase({required this.productsRepository});

  @override
  Future<Either<Failure, AppApiResponse<Model>>> call(params) {
    if (params is ProductListPrams) {
      return productsRepository.getProducts(
        nextUrl: params.nextUrl,
        limit: params.limit,
        offset: params.offset,
        search: params.search,
      );
    } else if (params is ProductItemPrams) {
      return productsRepository.getProductItem(slug: params.slug);
    } else {
      return productsRepository.getProducts();
    }
  }
}

class Prams extends Equatable {
  Prams();

  @override
  List<Object?> get props => [];
}

class ProductListPrams extends Prams {
  final String? nextUrl;
  final String? limit;
  final String? offset;
  final String? search;

  ProductListPrams({this.nextUrl, this.limit, this.offset, this.search});

  @override
  List<Object?> get props => [];
}

class ProductItemPrams extends Prams {
  final String? slug;

  ProductItemPrams({this.slug});

  @override
  List<Object?> get props => [];
}
