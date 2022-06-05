import 'package:flutter/material.dart';
import 'package:cv/features/_exports/screens_export.dart';

class Routes {
  static const String frontend = "/";
  // static const String productList = "/productList";
  // static const String productDetails = "/productDetails";
}

class RouteGenerator {
  var routes = {
    Routes.frontend: (context) => FrontendPage(),
  };

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text("No route found"),
        ),
        body: const Center(
          child: Text(
            "No route found",
          ),
        ),
      ),
    );
  }
}
