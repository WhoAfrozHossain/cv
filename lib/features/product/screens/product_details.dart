import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cv/core/utils/utils_export.dart';
import 'package:cv/core/widgets/custom_appbar_widget.dart';
import 'package:cv/core/widgets/custom_space_widget.dart';
import 'package:cv/features/product/data/model/product_model.dart';
import 'package:cv/features/product/screens/widgets/product_details_information_widget.dart';
import 'package:cv/features/product/screens/widgets/product_search_widget.dart';
import 'package:cv/features/product/screens/widgets/product_slider_widget.dart';

import '../../../main.dart';
import '../data/repositories/products_repository_impl.dart';
import '../domain/usecase/products_use_case.dart';
import 'bloc/product_bloc.dart';

// ignore: must_be_immutable
class ProductDetailsPage extends StatelessWidget {
  ProductDetailsPage({Key? key, required this.slug}) : super(key: key);

  final String? slug;

  ProductModel? item;

  @override
  Widget build(BuildContext context) {
    print(slug);

    return Scaffold(
      appBar: CustomAppbarWidget(
        title: AppStrings.productDetails,
      ),
      backgroundColor: ColorManager.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(
                AppPadding.p14,
                0,
                AppPadding.p14,
                AppPadding.p14,
              ),
              child: ProductSearchWidget(
                isBack: true,
              ),
            ),
            Expanded(
              child: BlocProvider(
                create: (_) => ProductBloc(
                  productsUseCase: ProductsUseCase(
                    productsRepository: ProductsRepositoryImpl(
                      appNetworkInfo: sl(),
                      productsRemoteDataSource: sl(),
                    ),
                  ),
                )..add(GetProductItemEvent(slug: slug ?? "")),
                child: BlocListener<ProductBloc, ProductState>(
                  listener: (context, state) {},
                  child: BlocBuilder<ProductBloc, ProductState>(
                    builder: (_, state) {
                      if (state is ProductItemSuccessState) {
                        item = state.item;
                        return productDetails(context, state.item);
                      } else {
                        if (item != null) {
                          return productDetails(context, item);
                        } else {
                          return Center(
                            child: Container(
                              padding: EdgeInsets.all(AppPadding.p20),
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  productDetails(BuildContext context, ProductModel? item) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(AppPadding.p14),
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          ProductSliderWidget(
            slider: item?.images ?? [],
          ),
          CustomSpaceWidget.fromHeight(AppSize.s20),
          ProductDetailsInformationWidget(item: item),
        ],
      ),
    );
  }
}
