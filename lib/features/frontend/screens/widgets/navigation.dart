import 'package:cv/core/utils/utils_export.dart';
import 'package:cv/core/widgets/custom_text_widget.dart';
import 'package:cv/features/frontend/screens/function/frontend_functions.dart';
import 'package:cv/main.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/data/models/social_model.dart';
import '../../../../core/widgets/custom_image_widget.dart';
import 'menu_button.dart';

// ignore: must_be_immutable
class Navigation extends StatelessWidget {
  final Function onTap;

  List<SocialModel> socialData = [];

  Navigation(this.onTap, {Key? key}) : super(key: key);

  Widget _buildNavigationOption(
    String title,
    IconData icon, {
    VoidCallback? onTap,
  }) {
    return MenuButton(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 6, bottom: 6),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
              size: 18,
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLinkingButton(BuildContext context, String icon, Uri url) {
    return Container(
      width: 32,
      height: 32,
      margin: const EdgeInsets.only(right: 12),
      child: FloatingActionButton(
          onPressed: () {
            launchUrl(url);
          },
          elevation: 2,
          backgroundColor: ColorManager.secondaryColor,
          child: CustomImageWidget(
            context: context,
            imageUrl: icon,
            height: 16,
            radius: 50,
          )),
    );
  }

  Widget _buildNavigation(BuildContext context) {
    return Card(
      color: ColorManager.primaryColor,
      elevation: 12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: 64,
                height: 64,
                child: CustomImageWidget(
                  context: context,
                  imageUrl: sl<FrontendFunctions>()
                      .frontendDataModel
                      ?.data
                      ?.info
                      ?.photo,
                  radius: 64,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  CustomTextWidget(
                    text: sl<FrontendFunctions>()
                            .frontendDataModel
                            ?.data
                            ?.info
                            ?.name ??
                        "",
                    style: getBoldStyle(
                      color: ColorManager.white,
                      fontSize: FontSize.s24,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      color: ColorManager.secondaryColor,
                      shape: BoxShape.circle,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 4),
              CustomTextWidget(
                text: sl<FrontendFunctions>()
                        .frontendDataModel
                        ?.data
                        ?.info
                        ?.post ??
                    "",
                style: TextStyle(
                  color: ColorManager.white,
                  fontWeight: FontWeight.w200,
                  fontSize: FontSize.s14,
                ),
              ),
              const SizedBox(height: 48),
              _buildNavigationOption("Home", Icons.home, onTap: () {
                onTap(0);
              }),
              _buildNavigationOption("About", Icons.account_box, onTap: () {
                onTap(1);
              }),
              _buildNavigationOption("Skills", Icons.book, onTap: () {
                onTap(2);
              }),
              _buildNavigationOption("Companies", Icons.work, onTap: () {
                onTap(3);
              }),
              _buildNavigationOption("Contact", Icons.contacts, onTap: () {
                onTap(4);
              }),
              const SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: socialData
                    .map(
                      (SocialModel item) => _buildLinkingButton(
                        context,
                        item.icon ?? "",
                        Uri.parse(item.link ?? ""),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 32),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  sl<FrontendFunctions>()
                          .frontendDataModel
                          ?.data
                          ?.info
                          ?.email ??
                      "",
                  style: TextStyle(
                    color: ColorManager.white.withOpacity(.5),
                    fontWeight: FontWeight.w100,
                    fontStyle: FontStyle.italic,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    socialData = sl<FrontendFunctions>().frontendDataModel?.data?.social ?? [];
    return _buildNavigation(context);
  }
}
