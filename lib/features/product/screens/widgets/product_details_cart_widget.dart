import 'package:flutter/material.dart';
import 'package:cv/core/apphelper/app_helper_functions.dart';
import 'package:cv/core/utils/utils_export.dart';
import 'package:cv/core/widgets/custom_space_widget.dart';
import 'package:cv/core/widgets/custom_text_widget.dart';

import '../../../../main.dart';
import '../function/product_functions.dart';
import 'cart_counter_widget.dart';

// ignore: must_be_immutable
class ProductDetailsCartWidget extends StatelessWidget {
  ProductDetailsCartWidget({
    Key? key,
    required this.slug,
    required this.stock,
  }) : super(key: key);

  final String slug;
  final int? stock;

  int productCount = 0;

  @override
  Widget build(BuildContext context) {
    productCount = sl<ProductFunctions>().getCurrentProduct(slug);

    return Column(
      children: [
        if (stock != null && stock! > 0 && productCount > 0)
          Center(
            child: Container(
              width: 170,
              child: CartCounterWidget(
                slug: slug,
                stock: stock ?? 0,
              ),
            ),
          ),
        CustomSpaceWidget.fromHeight(AppSize.s8),
        Stack(
          children: [
            Container(
              margin: EdgeInsets.only(right: 10),
              child: ClipPath(
                clipper: HexagonClipper(),
                child: InkWell(
                  onTap: () {
                    if (productCount < 1) {
                      sl<ProductFunctions>()
                          .addProductCart(context, slug, stock ?? 0);
                    }
                  },
                  child: Container(
                    height: 75,
                    width: 70,
                    decoration: BoxDecoration(
                      gradient: ColorManager().gradientButtonColor(),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (productCount > 0)
                            Icon(
                              Icons.local_mall_outlined,
                              color: ColorManager.white,
                            ),
                          CustomTextWidget(
                            text: productCount > 0
                                ? AppStrings.cart
                                : AppStrings.wantToBuy,
                            maxLine: 2,
                            isFullWidth: true,
                            style: getRegularStyle(
                              color: ColorManager.white,
                              fontSize: FontSize.s14,
                            ),
                            align: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (productCount > 0)
              Positioned(
                top: 10,
                right: 0,
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    color: ColorManager.secondaryLightColor,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: ColorManager.white, width: 2),
                  ),
                  child: Center(
                    child: CustomTextWidget(
                      text: "$productCount",
                      style: getMediumStyle(
                        color: ColorManager.secondaryColor,
                        fontSize: FontSize.s14,
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
      ],
    );
  }
}

class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.4050633, size.height * 0.02520384);
    path.cubicTo(
        size.width * 0.4638101,
        size.height * -0.005953047,
        size.width * 0.5361899,
        size.height * -0.005953058,
        size.width * 0.5949367,
        size.height * 0.02520384);
    path.lineTo(size.width * 0.8983684, size.height * 0.1861314);
    path.cubicTo(
        size.width * 0.9571165,
        size.height * 0.2172884,
        size.width * 0.9933051,
        size.height * 0.2748686,
        size.width * 0.9933051,
        size.height * 0.3371826);
    path.lineTo(size.width * 0.9933051, size.height * 0.6590360);
    path.cubicTo(
        size.width * 0.9933051,
        size.height * 0.7213500,
        size.width * 0.9571165,
        size.height * 0.7789302,
        size.width * 0.8983684,
        size.height * 0.8100872);
    path.lineTo(size.width * 0.5949367, size.height * 0.9710151);
    path.cubicTo(
        size.width * 0.5361899,
        size.height * 1.002172,
        size.width * 0.4638101,
        size.height * 1.002172,
        size.width * 0.4050633,
        size.height * 0.9710151);
    path.lineTo(size.width * 0.1016311, size.height * 0.8100872);
    path.cubicTo(
        size.width * 0.04288405,
        size.height * 0.7789302,
        size.width * 0.006694405,
        size.height * 0.7213500,
        size.width * 0.006694405,
        size.height * 0.6590372);
    path.lineTo(size.width * 0.006694405, size.height * 0.3371826);
    path.cubicTo(
        size.width * 0.006694405,
        size.height * 0.2748686,
        size.width * 0.04288405,
        size.height * 0.2172884,
        size.width * 0.1016311,
        size.height * 0.1861314);
    path.lineTo(size.width * 0.4050633, size.height * 0.02520384);
    path.close();

    // Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    // paint_0_fill.shader = ui.Gradient.linear(
    //     Offset(size.width * 0.4936709, size.height * -16.46814),
    //     Offset(size.width * 0.5000000, size.height * 2.160895),
    //     [Color(0xff6210E1).withOpacity(1), Color(0xff1400AE).withOpacity(1)],
    //     [0.223536, 0.555821]);
    // canvas.drawPath(path_0, paint_0_fill);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class TitleWithValueRow extends StatelessWidget {
  const TitleWithValueRow({
    Key? key,
    this.title,
    this.value,
    this.color,
    this.fontSize,
  }) : super(key: key);

  final String? title;
  final double? value;
  final Color? color;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTextWidget(
          text: title ?? "",
          style: getBoldStyle(color: color, fontSize: fontSize),
        ),
        if (value != null)
          CustomTextWidget(
            text: AmountGenerator.doubleToAmount(value ?? 0),
            style: getBoldStyle(color: color, fontSize: fontSize),
          ),
      ],
    );
  }
}
