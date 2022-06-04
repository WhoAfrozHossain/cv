import 'package:cv/features/frontend/screens/function/frontend_functions.dart';
import 'package:cv/main.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/utils_export.dart';
import '../../../../core/widgets/custom_image_widget.dart';
import 'base_page.dart';

class AppTabBar extends StatelessWidget {
  const AppTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      color: ColorManager.primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
            const SizedBox(width: 16),
            SizedBox(
              width: 32,
              height: 32,
              child: CustomImageWidget(
                context: context,
                imageUrl: sl<FrontendFunctions>()
                    .frontendDataModel
                    ?.data
                    ?.info
                    ?.photo,
                radius: 32,
              ),
            ),
            const SizedBox(width: 16),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: sl<FrontendFunctions>()
                            .frontendDataModel
                            ?.data
                            ?.info
                            ?.name ??
                        "",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  TextSpan(
                    text: ' ●',
                    style: getBoldStyle(
                      fontSize: FontSize.s14,
                      color: ColorManager.secondaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
