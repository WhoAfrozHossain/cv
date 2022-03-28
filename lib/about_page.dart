// ignore_for_file: constant_identifier_names

import 'package:cv/page_title.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'base_page.dart';
import 'data.dart';

const INTRODUCE =
    "I am Afroz, Mobile Developer from Dhaka, Bangladesh. I have rich experience in Mobile application development, I am good at Flutter.";

const SKILLS = """
Android (Both Java and Kotlin):
- Have 4 years+ experience in Android development.
- Familiar with MVC, MVP, MVVM, MVRX (AirBnb), Clean architecture,...
- Familiar with Android Jetpack, RxJava, FCM, Firebase, Google map, Socket, MQTT, Dagger, Koin...

Flutter:
- Have 3 year+ experience in Flutter.
- Familiar with Bloc, ScopeModel, Provider,...

Confident in Algorithm, OOP concepts, Design Pattern, SOLID principles,...
Proficient in using git.
""";

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
        padding: PAGE_CONTENT_PADDING,
        child: LayoutBuilder(
          builder: (_, constrain) {
            final maxWidth = constrain.maxWidth;
            final isTabletSize = _isTabletSize(maxWidth);
            const avatarSize = 108.0;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const PageTitle("About Me"),
                const SizedBox(height: 32),
                _multiChildLayout(
                  forTablet: isTabletSize,
                  children: <Widget>[
                    const SizedBox(width: 16),
                    const SizedBox(
                      width: avatarSize,
                      height: avatarSize,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(Data.AVATAR),
                        backgroundColor: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 36, height: 32),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            "Hello,",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            INTRODUCE,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 24),
                          LayoutBuilder(
                            builder: (_, constrains) => Wrap(
                              direction: Axis.horizontal,
                              children: Data.ABOUT_PAGE_INFO.entries
                                  .toList()
                                  .map((pair) => SizedBox(
                                      width: isTabletSize
                                          ? constrains.maxWidth / 2
                                          : constrains.maxWidth,
                                      child:
                                          _buildInfoLine(pair.key, pair.value)))
                                  .toList(),
                            ),
                          ),
                          const SizedBox(width: 36, height: 16),
                          Wrap(
                            runSpacing: 12,
                            spacing: 12,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            children: <Widget>[
                              MaterialButton(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 42,
                                  vertical: 20,
                                ),
                                onPressed: downloadCV,
                                color: SUB_COLOR,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
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
                              MaterialButton(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 42,
                                  vertical: 20,
                                ),
                                onPressed: hireMe,
                                color: MAIN_COLOR,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
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
