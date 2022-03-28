import 'package:cv/data.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'base_page.dart';

class AppTabBar extends StatelessWidget {
  const AppTabBar({Key? key}) : super(key: key);

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
            const SizedBox(
              width: 32,
              height: 32,
              child: CircleAvatar(
                backgroundImage: AssetImage(Data.AVATAR),
                backgroundColor: Colors.white,
              ),
            ),
            const SizedBox(width: 16),
            RichText(
              text: const TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: Data.NAME,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  TextSpan(
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
