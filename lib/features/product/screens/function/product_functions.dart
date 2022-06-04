import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cv/core/apphelper/appResponse/app_api_response.dart';
import 'package:cv/core/database/localDb/localDBFuncation.dart';
import 'package:cv/core/error/failures.dart';
import 'package:cv/core/widgets/app_snack_bar.dart';
import 'package:cv/features/product/data/model/product_item_model.dart';
import 'package:cv/features/product/data/model/product_list_model.dart';
import 'package:cv/features/product/data/model/product_model.dart';
import 'package:cv/features/product/domain/usecase/products_use_case.dart';
import 'package:cv/features/product/screens/bloc/product_bloc.dart';

import '../../data/model/product_cart_model.dart';

class ProductFunctions {
  BuildContext? context;

  ScrollController productListScrollController = new ScrollController();

  TextEditingController searchController = new TextEditingController();

  String searchTextValue = "";

  List<ProductModel> productList = [];
  List<int> productCart = [];
  ProductListModel? productListModel;

  ProductItemModel? productItemModel;

  ProductCartModel cartModel = ProductCartModel();

  bool isLoadingData = false;

  init(BuildContext context) {
    this.context = context;

    // BlocProvider.of<ProductBloc>(context).add(GetProductListEvent());
    BlocProvider.of<ProductBloc>(context).add(GetProductCartCountEvent());
  }

  searchProduct(BuildContext context) {
    this.context = context;

    BlocProvider.of<ProductBloc>(context).add(
      GetProductListEvent(
        search: searchTextValue,
      ),
    );
  }

  Future getProductListData(GetProductListEvent event,
      Emitter<ProductState> emit, ProductsUseCase productUseCase,
      {bool isPagination: false}) async {
    emit(ProductLoadingState(isPagination: isPagination));

    Either<Failure, AppApiResponse> _res = await productUseCase.call(
        ProductListPrams(
            nextUrl: event.nextUrl,
            limit: event.limit,
            offset: event.offset,
            search: event.search));

    _res.fold((l) async {
      isLoadingData = false;

      emit(ProductsListErrorState());
    }, (r) {
      productListModel = ProductListModel.fromJson(jsonDecode(r.body!));

      if (event.nextUrl == null) {
        productList = productListModel?.data?.products?.results ?? [];
      } else {
        productList.addAll(productListModel?.data?.products?.results ?? []);
      }

      isLoadingData = false;

      emit(ProductsListSuccessState(productsList: productList));
    });
  }

  Future getProductItemData(GetProductItemEvent event,
      Emitter<ProductState> emit, ProductsUseCase productUseCase) async {
    Either<Failure, AppApiResponse> _res =
        await productUseCase.call(ProductItemPrams(slug: event.slug));

    _res.fold((l) async {
      isLoadingData = false;

      emit(ProductsListErrorState());
    }, (r) {
      productItemModel = ProductItemModel.fromJson(jsonDecode(r.body!));

      isLoadingData = false;

      emit(ProductItemSuccessState(item: productItemModel?.data));
    });
  }

  productListControllerListen(BuildContext context) {
    productListScrollController.addListener(() {
      if (productListScrollController.position.maxScrollExtent <
          productListScrollController.offset) {
        if (productListModel?.data?.products?.next != null &&
            isLoadingData == false) {
          isLoadingData = true;
          BlocProvider.of<ProductBloc>(context).add(
            GetProductListEvent(
              nextUrl: productListModel?.data?.products?.next ?? null,
              isPagination: true,
            ),
          );
        }
      }
    });
  }

  Future getProductCartCountData(
      GetProductCartCountEvent event, Emitter<ProductState> emit) async {
    Map? value = await LocalDbFunctionImpl().getCart();

    if (value != null) {
      cartModel = ProductCartModel.fromJson(value);
    }

    emit(ProductCartCountState(cartModel: cartModel));
  }

  setProductCart(String slug, int value) async {
    bool canCartUpdate = false;

    if (cartModel.carts != null && cartModel.carts!.isNotEmpty) {
      for (int i = 0; i < cartModel.carts!.length; i++) {
        if (cartModel.carts![i].slug == slug) {
          cartModel.carts![i].cartCount = value;

          canCartUpdate = true;
        }
      }
      if (!canCartUpdate) {
        cartModel.carts!.add(ProductCartItem(slug: slug, cartCount: value));
      }
    } else {
      cartModel.carts = [];
      cartModel.carts!.add(ProductCartItem(slug: slug, cartCount: value));
    }

    await LocalDbFunctionImpl().setCart(jsonEncode(cartModel.toJson()));

    BlocProvider.of<ProductBloc>(context!).add(GetProductCartCountEvent());
  }

  int getCurrentProduct(String slug) {
    int currentValue = 0;

    if (cartModel.carts != null && cartModel.carts!.isNotEmpty) {
      for (int i = 0; i < cartModel.carts!.length; i++) {
        if (cartModel.carts![i].slug == slug) {
          currentValue = cartModel.carts?[i].cartCount ?? 0;
        }
      }
    }

    return currentValue;
  }

  addProductCart(BuildContext context, String slug, int stock) async {
    this.context = context;

    int value = getCurrentProduct(slug);

    if (value < stock) {
      setProductCart(slug, value + 1);
    } else {
      AppSnackBar.showErrorMessage(message: "Sorry, Stock is over");
    }
  }

  removeProductCart(BuildContext context, String slug) async {
    this.context = context;

    int value = getCurrentProduct(slug);

    if (value > 0) {
      setProductCart(slug, value - 1);
    } else {
      // AppSnackBar.showErrorMessage(message: "Sorry, Stock is over");
    }
  }
}
