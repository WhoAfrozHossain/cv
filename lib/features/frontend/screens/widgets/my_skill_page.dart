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
  // ignore: unused_element
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
                color: ColorManager.black,
                fontSize: FontSize.s24,
              ),
            ),
            const SizedBox(height: 20),
            if (sl<FrontendFunctions>().frontendDataModel?.data?.info?.skill !=
                null)
              CustomTextWidget(
                text: sl<FrontendFunctions>()
                        .frontendDataModel
                        ?.data
                        ?.info
                        ?.skill ??
                    "",
                isHtml: true,
              ),
          ],
        ),
      ),
    );
  }
}
