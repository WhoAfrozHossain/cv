import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cv/features/product/screens/function/product_functions.dart';

import '../../../../main.dart';
import 'product_grid_item_widget.dart';

class ProductGridListWidget extends StatelessWidget {
  const ProductGridListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: .6,
      ),
      itemBuilder: (_, index) => ProductGridItemWidget(
          item: sl<ProductFunctions>().productList[index]),
      itemCount: sl<ProductFunctions>().productList.length,
    );
  }
}
