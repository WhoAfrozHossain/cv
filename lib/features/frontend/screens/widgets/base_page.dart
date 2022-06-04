import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  final Color? color;
  final Widget child;

  const BasePage({Key? key, 
    this.color,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: child,
    );
  }
}
