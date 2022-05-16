// ignore_for_file: constant_identifier_names

import 'package:cv/data.dart';
import 'package:cv/get_in_touch_page.dart';
import 'package:cv/home_page.dart';
import 'package:cv/navigation.dart';
import 'package:cv/tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'about_page.dart';
import 'companies_page.dart';
import 'my_skill_page.dart';

const VERTICAL_PADDING_SIZE = 32.0;
const PAGE_PADDING_SIZE = 18.0;

const MAIN_COLOR = Color(0xff5A72EA);
const SUB_COLOR = Color(0xffFF5A59);

const MIN_TABLET_SIZE = 1080;

const VERTICAL_PAGE_PADDING = 54.0;
const HORIZONTAL_PAGE_PADDING = 48.0;

const PAGE_CONTENT_PADDING = EdgeInsets.symmetric(
  vertical: VERTICAL_PAGE_PADDING,
  horizontal: HORIZONTAL_PAGE_PADDING,
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Data.WEB_TITLE,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.openSans().fontFamily,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: SUB_COLOR),
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void _downloadCV() {
    launchUrlString(Data.CV_URL);
  }

  void _hireMe() {
    scrollToIndex(keys.length - 1);
  }

  Widget pagePadding([Key? key]) => SizedBox(
        key: key,
        height: PAGE_PADDING_SIZE,
      );

  Widget _homePage() {
    return IntrinsicHeight(
      child: Stack(
        children: <Widget>[
          Opacity(
            opacity: 0,
            child: Navigation((_) {}),
          ),
          Positioned.fill(
            child: HomePage(
              key: keys[0],
              downloadCV: _downloadCV,
              hireMe: _hireMe,
            ),
          )
        ],
      ),
    );
  }

  final keys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  final scrollBar = ScrollController();

  Widget _buildListDetail(bool forTablet) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: SingleChildScrollView(
        controller: scrollBar,
        padding: const EdgeInsets.only(bottom: VERTICAL_PADDING_SIZE),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: VERTICAL_PADDING_SIZE),
            Visibility(visible: !forTablet, child: const AppTabBar()),
            _homePage(),
            pagePadding(),
            // BasePage(
            //   child: InkWell(
            //     onTap: () => launch(Data.CERTIFICATE_URL),
            //     child: Image.asset('image/cer.png'),
            //   ),
            // ),
            // pagePadding(),
            AboutPage(keys[1], _downloadCV, _hireMe),
            pagePadding(),
            MySkillPage(keys[2]),
            pagePadding(),
            CompanyPage(keys[3]),
            pagePadding(),
            GetInTouchPage(keys[4]),
          ],
        ),
      ),
    );
  }

  void scrollToIndex(int index) {
    Scrollable.ensureVisible(
      keys[index].currentContext!,
      duration: const Duration(milliseconds: 500),
    );
    if (_scaffoldKey.currentState!.isDrawerOpen) {
      Navigator.of(context).pop();
    }
  }

  Widget _buildNavigation(bool forTablet) {
    return Padding(
      padding: EdgeInsets.only(top: forTablet ? VERTICAL_PADDING_SIZE : 0),
      child: Navigation((index) {
        scrollToIndex(index);
      }),
    );
  }

  Widget _buildTabletBody(double width) {
    return Scaffold(
      key: _scaffoldKey,
      body: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildNavigation(true),
          const SizedBox(width: 24),
          LimitedBox(
            maxWidth: 720,
            child: _buildListDetail(true),
          )
        ],
      ),
    );
  }

  Widget _buildPhoneBody() {
    return Scaffold(
      key: _scaffoldKey,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: _buildListDetail(false),
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.transparent,
        ),
        child: Drawer(
          child: _buildNavigation(false),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constrain) {
        return Scrollbar(
          // isAlwaysShown: true,
          scrollbarOrientation: ScrollbarOrientation.right,
          controller: scrollBar,
          child: constrain.maxWidth >= MIN_TABLET_SIZE
              ? _buildTabletBody(constrain.maxWidth)
              : _buildPhoneBody(),
        );
      },
    );
  }
}
