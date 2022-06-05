import 'package:cv/core/utils/color_manager.dart';
import 'package:cv/core/utils/font_manager.dart';
import 'package:cv/core/utils/styles_manager.dart';
import 'package:cv/core/utils/values_manager.dart';
import 'package:cv/core/widgets/custom_image_widget.dart';
import 'package:cv/core/widgets/custom_space_widget.dart';
import 'package:cv/core/widgets/custom_text_button.dart';
import 'package:cv/core/widgets/custom_text_widget.dart';
import 'package:cv/features/frontend/screens/function/frontend_functions.dart';
import 'package:flutter/material.dart';

import '../../../../main.dart';
import 'base_page.dart';

const AVATAR_SIZE = 108.0;

class AboutPage extends StatelessWidget {
  final VoidCallback? downloadCV;
  final VoidCallback? hireMe;

  const AboutPage(GlobalKey key, this.downloadCV, this.hireMe)
      : super(key: key);

  Widget _multiChildLayout({
    required bool forTablet,
    required List<Widget> children,
  }) {
    Widget result;
    if (!forTablet) {
      result = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: children,
      );
    } else {
      result = Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      );
    }
    return result;
  }

  bool _isTabletSize(double maxWidth) {
    return maxWidth > 4 * AVATAR_SIZE;
  }

  // ignore: unused_element
  Widget _buildInfoLine(String field, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: "$field: ",
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(color: Colors.black87, fontSize: 14),
          ),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppPadding.p54,
          horizontal: AppPadding.p48,
        ),
        child: LayoutBuilder(
          builder: (_, constrain) {
            final maxWidth = constrain.maxWidth;
            final isTabletSize = _isTabletSize(maxWidth);
            const avatarSize = 108.0;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CustomTextWidget(
                  text: "About Me",
                  style: getBoldStyle(
                    color: ColorManager.black,
                    fontSize: FontSize.s24,
                  ),
                ),
                CustomSpaceWidget.fromHeight(32),
                _multiChildLayout(
                  forTablet: isTabletSize,
                  children: <Widget>[
                    const SizedBox(width: 16),
                    SizedBox(
                      width: avatarSize,
                      height: avatarSize,
                      child: CustomImageWidget(
                        context: context,
                        imageUrl: sl<FrontendFunctions>()
                            .frontendDataModel
                            ?.data
                            ?.info
                            ?.photo,
                        radius: avatarSize,
                      ),
                    ),
                    const SizedBox(width: 36, height: 32),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          CustomTextWidget(
                            text: "Hello,",
                            style: getBoldStyle(
                              fontSize: FontSize.s22,
                            ),
                          ),
                          CustomSpaceWidget.fromHeight(24),
                          CustomTextWidget(
                            text: sl<FrontendFunctions>()
                                    .frontendDataModel
                                    ?.data
                                    ?.info
                                    ?.aboutMe ??
                                "",
                            style: getRegularStyle(
                              fontSize: FontSize.s14,
                              color: ColorManager.grey,
                            ),
                          ),
                          CustomSpaceWidget.fromHeight(24),
                          // LayoutBuilder(
                          //   builder: (_, constrains) => Wrap(
                          //     direction: Axis.horizontal,
                          //     children: Data.ABOUT_PAGE_INFO.entries
                          //         .toList()
                          //         .map((pair) => SizedBox(
                          //             width: isTabletSize
                          //                 ? constrains.maxWidth / 2
                          //                 : constrains.maxWidth,
                          //             child:
                          //                 _buildInfoLine(pair.key, pair.value)))
                          //         .toList(),
                          //   ),
                          // ),
                          const SizedBox(width: 36, height: 16),
                          Wrap(
                            runSpacing: 12,
                            spacing: 12,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            children: <Widget>[
                              CustomTextButton(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 42,
                                  vertical: 20,
                                ),
                                onPressed: downloadCV,
                                buttonColor: ColorManager.secondaryColor,
                                radius: 32,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Icon(
                                      Icons.file_download,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                    SizedBox(width: 6),
                                    Text(
                                      "Download my CV",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              CustomTextButton(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 42,
                                  vertical: 20,
                                ),
                                onPressed: hireMe,
                                buttonColor: ColorManager.primaryColor,
                                radius: 32,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    Icon(
                                      Icons.email,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                    SizedBox(width: 6),
                                    Text(
                                      "Hire me",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
