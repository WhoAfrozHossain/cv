import 'package:flutter/cupertino.dart';
import 'package:cv/core/utils/utils_export.dart';
import 'package:cv/core/widgets/custom_icon_button.dart';
import 'package:cv/core/widgets/custom_text_field_widget.dart';

import '../../../../main.dart';
import '../function/product_functions.dart';

class ProductSearchWidget extends StatelessWidget {
  const ProductSearchWidget({Key? key, required this.isBack}) : super(key: key);

  final bool isBack;

  @override
  Widget build(BuildContext context) {
    return CustomTextFieldWidget(
      hintText: AppStrings.searchHint,
      controller: sl<ProductFunctions>().searchController,
      onChanged: (value) {
        sl<ProductFunctions>().searchTextValue = value ?? "";
      },
      suffixIcon: CustomIconButton(
        icon: Icon(CupertinoIcons.search),
        onTap: () {
          print("Search Call");
          if (isBack) {
            Navigator.pop(context);
          }
          sl<ProductFunctions>().searchProduct(context);
        },
      ),
    );
  }
}
