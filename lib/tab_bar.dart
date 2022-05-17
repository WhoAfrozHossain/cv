import 'package:cv/network/models/all_data_model.dart';
import 'package:cv/widget/custom_image_widget.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'base_page.dart';

class AppTabBar extends StatelessWidget {
  final AllDataModel? networkData;

  const AppTabBar({Key? key, required this.networkData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      color: MAIN_COLOR,
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
                  imageUrl: networkData?.data?.info?.photo,
                  radius: 32,
                ),
            ),
            const SizedBox(width: 16),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: networkData?.data?.info?.name ?? "",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const TextSpan(
                    text: ' ●',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: SUB_COLOR,
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
