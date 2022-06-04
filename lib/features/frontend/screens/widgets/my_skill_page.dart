import 'package:flutter_html/flutter_html.dart' as html;
import 'package:cv/core/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import '../../../../core/data/models/platform_model.dart';
import '../../../../core/utils/utils_export.dart';
import '../../../../main.dart';
import '../function/frontend_functions.dart';
import 'base_page.dart';

class MySkillPage extends StatefulWidget {
  const MySkillPage(GlobalKey key) : super(key: key);

  @override
  State<MySkillPage> createState() => _MySkillPageState();
}

class _MySkillPageState extends State<MySkillPage> {
  Widget _buildSkillItem(PlatformModel skill) {
    return CustomTextWidget(
      text: skill.title ?? "",
      style: getBoldStyle(fontSize: FontSize.s16),
    );
    // return Column(
    //   mainAxisSize: MainAxisSize.min,
    //   children: <Widget>[
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       crossAxisAlignment: CrossAxisAlignment.end,
    //       children: <Widget>[
    //         Text(
    //           skill.title ?? "",
    //           style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    //         ),
    //         Text(
    //           "${skill.percent}%",
    //           style: const TextStyle(fontSize: 14),
    //         )
    //       ],
    //     ),
    //     const SizedBox(height: 8),
    //     Stack(
    //       children: <Widget>[
    //         Container(
    //           height: 3,
    //           decoration: BoxDecoration(
    //             color: Colors.grey.withOpacity(.5),
    //             borderRadius: BorderRadius.circular(12),
    //           ),
    //         ),
    //         FractionallySizedBox(
    //           widthFactor: skill.percent / 100,
    //           child: Container(
    //             height: 3,
    //             decoration: BoxDecoration(
    //               color: Colors.red,
    //               borderRadius: BorderRadius.circular(12),
    //             ),
    //           ),
    //         )
    //       ],
    //     ),
    //   ],
    // );
  }

  @override
  Widget build(BuildContext context) {
    // List<PlatformModel> skills = widget.networkData?.data?.platform ?? [];

    return BasePage(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppPadding.p54,
          horizontal: AppPadding.p48,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomTextWidget(
              text: "My skills",
              style: getBoldStyle(
                fontSize: FontSize.s24,
              ),
            ),
            const SizedBox(height: 20),
            // Text(
            //   widget.networkData?.data?.info?.skill ?? "",
            //   style: const TextStyle(
            //     fontSize: 14,
            //     color: Colors.grey,
            //   ),
            // ),
            CustomTextWidget(
              text: sl<FrontendFunctions>()
                        .frontendDataModel
                        ?.data
                        ?.info
                        ?.skill ??
                    "",
                    isHtml: true,
            ),
            SizedBox(width: double.infinity,
            child: html.Html(
              shrinkWrap: true,
              data: sl<FrontendFunctions>()
                        .frontendDataModel
                        ?.data
                        ?.info
                        ?.skill ??
                    "",
            ),),
            // const SizedBox(height: 24),
            // LayoutBuilder(
            //   builder: (_, constrain) {
            //     final maxWidth = constrain.maxWidth;
            //     const widthForTablet = 500;
            //     final skillWidth =
            //         maxWidth > widthForTablet ? (maxWidth - 24) / 2 : maxWidth;
            //     return Wrap(
            //       spacing: 24,
            //       runSpacing: 24,
            //       children: skills
            //           .map(
            //             (skill) => SizedBox(
            //               width: skillWidth,
            //               child: _buildSkillItem(skill),
            //             ),
            //           )
            //           .toList(),
            //     );
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
