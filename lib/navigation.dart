import 'package:cv/network/models/all_data_model.dart';
import 'package:cv/network/models/social_model.dart';
import 'package:cv/widget/custom_image_widget.dart';
import 'package:cv/widget/menu_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'app.dart';

// ignore: must_be_immutable
class Navigation extends StatelessWidget {
  final Function onTap;
  final AllDataModel? networkData;

  List<SocialModel> socialData = [];

  Navigation(this.onTap, {Key? key, required this.networkData})
      : super(key: key);

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
        backgroundColor: SUB_COLOR,
        child: CustomImageWidget(context: context, imageUrl: icon,height: 16, )
      ),
    );
  }

  Widget _buildNavigation(BuildContext context) {
    return Card(
      color: MAIN_COLOR,
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
                  imageUrl: networkData?.data?.info?.photo,
                  radius: 64,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Text(
                    networkData?.data?.info?.name ?? "",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.only(top: 8),
                    decoration: const BoxDecoration(
                      color: SUB_COLOR,
                      shape: BoxShape.circle,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 4),
              const Text(
                "Mobile developer",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w200,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 48),
              _buildNavigationOption("Home", Icons.home, onTap: () {
                onTap(0);
              }),
              _buildNavigationOption("About", Icons.account_box, onTap: () {
                onTap(1);
              }),
              _buildNavigationOption("Resume", Icons.book, onTap: () {
                onTap(2);
              }),
              _buildNavigationOption("Work", Icons.work, onTap: () {
                onTap(3);
              }),
              _buildNavigationOption("Contact", Icons.contacts, onTap: () {
                onTap(4);
              }),
              const SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: socialData.map((SocialModel item) => _buildLinkingButton(
                  context,
                    item.icon ?? "",
                    Uri.parse(item.link ?? ""),
                  ),
                ).toList(),
              ),
              const SizedBox(height: 32),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  networkData?.data?.info?.email ?? "",
                  style: TextStyle(
                    color: Colors.white.withOpacity(.5),
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
    socialData = networkData?.data?.social ?? [];
    return _buildNavigation(context);
  }
}
