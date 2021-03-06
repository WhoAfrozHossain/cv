import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:cv/core/utils/utils_export.dart';
import 'package:cv/inject_container.dart';
import 'package:cv/core/url_strategy/url_strategy_native.dart'
    if (dart.library.html) 'package:cv/core/url_strategy/url_strategy_web.dart';
import 'package:seo_renderer/seo_renderer.dart';
import 'core/apphelper/app_helper.dart';

GetIt sl = GetIt.instance;

late BuildContext globalContext;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  urlConfig();

  await intiGetIt();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: ColorManager.primaryColor,
    ),
  );
  runApp(RobotDetector(
    debug: false, // you can set true to enable robot mode
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: AppHelper.snackBarKey,
      title: "Afroz Hossain",
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.frontend,
      // onUnknownRoute: (RouteSettings settings) {
      //   return MaterialPageRoute<void>(
      //     settings: settings,
      //     builder: (BuildContext context) =>
      //         Scaffold(body: Center(child: Text('Not Found'))),
      //   );
      // },
      routes: RouteGenerator().routes,
      theme: getApplicationTheme(),
    );
  }
}
