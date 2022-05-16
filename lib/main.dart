import 'package:cv/app.dart';
import 'package:flutter/material.dart';
import 'package:cv/url_strategy/url_strategy_native.dart'
    if (dart.library.html) 'package:cv/url_strategy/url_strategy_web.dart';

void main() {
  urlConfig();

  runApp(const MyApp());
}
