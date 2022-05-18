import 'package:cv/app.dart';
import 'package:cv/base_page.dart';
import 'package:cv/network/models/all_data_model.dart';
import 'package:cv/network/models/platform_model.dart';
import 'package:cv/page_title.dart';
import 'package:flutter/material.dart';

class MySkillPage extends StatefulWidget {
  final AllDataModel? networkData;

  const MySkillPage(GlobalKey key, {required this.networkData})
      : super(key: key);

  @override
  State<MySkillPage> createState() => _MySkillPageState();
}

class _MySkillPageState extends State<MySkillPage> {
  Widget _buildSkillItem(PlatformModel skill) {

    return Text(
              skill.title ?? "",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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

    List<PlatformModel> skills = widget.networkData?.data?.platform ?? [];

    return BasePage(
      color: Colors.white,
      child: Padding(
        padding: PAGE_CONTENT_PADDING,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const PageTitle("My skills"),
            const SizedBox(height: 32),
            Text(
              widget.networkData?.data?.info?.skill ?? "",
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),
            LayoutBuilder(
              builder: (_, constrain) {
                final maxWidth = constrain.maxWidth;
                const widthForTablet = 500;
                final skillWidth =
                    maxWidth > widthForTablet ? (maxWidth - 24) / 2 : maxWidth;
                return Wrap(
                  spacing: 24,
                  runSpacing: 24,
                  children: skills
                      .map(
                        (skill) => SizedBox(
                          width: skillWidth,
                          child: _buildSkillItem(skill),
                        ),
                      )
                      .toList(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
