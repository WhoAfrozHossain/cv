import 'package:flutter/material.dart';
import 'package:cv/core/apphelper/app_helper_functions.dart';
import 'package:cv/core/utils/utils_export.dart';
import 'package:cv/core/widgets/custom_image_widget.dart';
import 'package:cv/core/widgets/custom_space_widget.dart';
import 'package:cv/core/widgets/custom_text_widget.dart';
import 'package:cv/features/product/data/model/product_model.dart';

import 'cart_counter_widget.dart';

class ProductGridItemWidget extends StatelessWidget {
  const ProductGridItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ProductModel item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: AppSize.s15,
          child: InkWell(
            onTap: () {
              // Navigator.pushNamed(
              //   context,
              //   Routes.productDetails,
              //   arguments: {
              //     "product_slug": item.slug ?? "",
              //   },
              // ).then((value) {
              //   BlocProvider.of<ProductBloc>(context)
              //       .add(GetProductCartCountEvent());
              // });
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.circular(AppSize.s16),
              ),
              padding: EdgeInsets.fromLTRB(
                AppSize.s8,
                AppSize.s8,
                AppSize.s8,
                AppSize.s15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Center(
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(AppPadding.p16),
                          child: CustomImageWidget(
                            context: context,
                            imageUrl: item.image,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  CustomTextWidget(
                    text: item.productName ?? "",
                    maxLine: 2,
                    isFullWidth: true,
                    style: getRegularStyle(
                      color: ColorManager.black,
                      fontSize: FontSize.s15,
                    ),
                  ),
                  CustomSpaceWidget.fromHeight(5),
                  Wrap(
                    spacing: 10.0,
                    children: [
                      TitleWithValueRow(
                        title: AppStrings.buy,
                        value: item.charge?.currentCharge,
                        valueColor: ColorManager.secondaryColor,
                        valueSize: FontSize.s15,
                      ),
                      TitleWithValueRow(
                        value: item.charge?.discountCharge,
                        isRemove: true,
                        valueColor: ColorManager.secondaryColor,
                        valueSize: FontSize.s12,
                      ),
                    ],
                  ),
                  Wrap(
                    spacing: 10.0,
                    children: [
                      TitleWithValueRow(
                        title: AppStrings.sell,
                        value: item.charge?.sellingPrice,
                        valueColor: ColorManager.darkGrey,
                        valueSize: FontSize.s12,
                      ),
                      TitleWithValueRow(
                        title: AppStrings.profit,
                        value: item.charge?.profit,
                        valueColor: ColorManager.darkGrey,
                        valueSize: FontSize.s12,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        if (item.stock == null || item.stock! < 1)
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              decoration: BoxDecoration(
                color: ColorManager.secondaryLightColor,
                borderRadius: BorderRadius.circular(5),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: CustomTextWidget(
                text: AppStrings.no_stock,
                style: getRegularStyle(
                  color: ColorManager.secondaryColor,
                  fontSize: FontSize.s14,
                ),
              ),
            ),
          ),
        if (item.stock != null && item.stock! > 0)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(
              child: CartCounterWidget(
                slug: item.slug ?? "",
                stock: item.stock ?? 0,
              ),
            ),
          ),
      ],
    );
  }
}

class TitleWithValueRow extends StatelessWidget {
  const TitleWithValueRow({
    Key? key,
    this.title,
    this.value,
    this.isRemove = false,
    this.valueColor,
    this.valueSize,
  }) : super(key: key);

  final String? title;
  final double? value;
  final bool isRemove;
  final Color? valueColor;
  final double? valueSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != null)
          CustomTextWidget(
            text: title ?? "",
            style: getRegularStyle(fontSize: FontSize.s10),
          ),
        if (title != null) CustomSpaceWidget.fromWidth(5),
        if (value != null)
          CustomTextWidget(
            text: AmountGenerator.doubleToAmount(value ?? 0),
            style:
                getBoldStyle(color: valueColor, fontSize: valueSize).copyWith(
              decoration: isRemove ? TextDecoration.lineThrough : null,
            ),
          ),
      ],
    );
  }
}
