import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cv/core/utils/utils_export.dart';
import 'package:cv/features/product/screens/function/product_functions.dart';
import 'package:cv/features/product/screens/widgets/product_grid_list_widget.dart';
import 'package:cv/features/product/screens/widgets/product_search_widget.dart';

import '../../../main.dart';
import 'bloc/product_bloc.dart';

// ignore: must_be_immutable
class ProductListPage extends StatelessWidget {
  ProductListPage({Key? key}) : super(key: key);

  bool _isPagination = false;

  // ProductsListSuccessState? _state;

  @override
  Widget build(BuildContext context) {
    sl<ProductFunctions>().init(context);
    sl<ProductFunctions>().productListControllerListen(context);

    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(AppPadding.p14),
              child: ProductSearchWidget(isBack: false),
            ),
            Expanded(
              child: BlocListener<ProductBloc, ProductState>(
                listener: (context, state) {
                  if (state is ProductLoadingState) {
                    _isPagination = state.isPagination!;
                    print("_isPagination :: $_isPagination");
                  }
                },
                child: BlocBuilder<ProductBloc, ProductState>(
                  builder: (_, state) {
                    if (state is ProductsListErrorState) {
                      return Center(
                        child: Text("Something went wrong."),
                      );
                    } else if (state is ProductsListSuccessState) {
                      // _state = state;
                      return _productList(false);
                    } else if (state is ProductCartCountState) {
                      return _productList(false);
                    } else if (_isPagination) {
                      return _productList(true);
                    } else {
                      return Center(
                        child: Container(
                          padding: EdgeInsets.all(AppPadding.p20),
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _productList(bool isLoading) {
    return SingleChildScrollView(
      controller: sl<ProductFunctions>().productListScrollController,
      padding: EdgeInsets.all(AppPadding.p14),
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          ProductGridListWidget(),
          if (isLoading)
            Container(
              padding: EdgeInsets.all(AppPadding.p20),
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
