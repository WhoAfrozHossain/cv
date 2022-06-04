import 'package:cv/core/utils/utils_export.dart';
import 'package:cv/core/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../main.dart';
import '../function/frontend_functions.dart';
import 'base_page.dart';

class HomePage extends StatelessWidget {
  final VoidCallback? downloadCV;
  final VoidCallback? hireMe;

  const HomePage({
    GlobalKey? key,
    this.downloadCV,
    this.hireMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constrain) {
        return BasePage(
          color: ColorManager.primaryColor,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: constrain.maxWidth / 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  child: Row(
                    children: [
                      CustomTextWidget(
                        text:
                            "I'm ${sl<FrontendFunctions>().frontendDataModel?.data?.info?.name ?? ""}",
                        style: getBoldStyle(
                          color: ColorManager.white,
                          fontSize: FontSize.s30,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        width: 12,
                        height: 12,
                        margin: const EdgeInsets.only(top: 16),
                        decoration: BoxDecoration(
                          color: ColorManager.secondaryColor,
                          shape: BoxShape.circle,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                CustomTextWidget(
                  text: sl<FrontendFunctions>()
                          .frontendDataModel
                          ?.data
                          ?.info
                          ?.carrierWords ??
                      "",
                  style: TextStyle(
                    color: ColorManager.white,
                    fontWeight: FontWeight.w100,
                    fontSize: FontSize.s16,
                  ),
                ),
                // const SizedBox(height: 8),
                // const Align(
                //   alignment: Alignment.centerRight,
                //   child: Text(
                //     "- ${Data.HOME_AUTHOR} -",
                //     textAlign: TextAlign.left,
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontWeight: FontWeight.w100,
                //       fontStyle: FontStyle.italic,
                //       fontSize: 14,
                //     ),
                //   ),
                // ),
                const SizedBox(height: 32),
                Wrap(
                  runSpacing: 12,
                  spacing: 12,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: <Widget>[
                    CustomTextButton(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 48, vertical: 24),
                      onPressed: downloadCV,
                      buttonColor: ColorManager.secondaryColor,
                      radius: 32,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(
                            Icons.file_download,
                            color: Colors.white,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Download my CV",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    CustomTextButton(
                      onPressed: hireMe,
                      buttonColor: ColorManager.primaryColor,
                      padding: EdgeInsets.symmetric(
                            horizontal: 48,
                            vertical: 24,
                          ),
                          addBorder: true,
                          radius: 32,
                      
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Hire me",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
