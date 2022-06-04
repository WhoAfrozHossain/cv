import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:cv/core/utils/utils_export.dart';
import 'package:cv/core/widgets/custom_image_widget.dart';
import 'package:cv/features/product/data/model/image_model.dart';

class ProductSliderWidget extends StatelessWidget {
  final List<ImageModel> slider;

  const ProductSliderWidget({
    Key? key,
    required this.slider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 1.3,
        enlargeCenterPage: true,
        viewportFraction: .7,
        reverse: true,
        autoPlay: true,
      ),
      items: slider.map(
        (ImageModel image) {
          return Container(
            decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.circular(AppSize.s16),
            ),
            padding: EdgeInsets.all(AppSize.s36),
            child: CustomImageWidget(
              context: context,
              imageUrl: image.image,
              fit: BoxFit.fill,
            ),
          );
        },
      ).toList(),
    );
  }
}
