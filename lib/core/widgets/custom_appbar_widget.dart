import 'package:cv/core/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

import '../utils/utils_export.dart';

// ignore: must_be_immutable
class CustomAppbarWidget extends PreferredSize {
  final String? title;
  Color? backgroundColor, backButtonColor, textColor;
  final TextStyle? textStyle;
  final List<Widget>? actions;
  final Function()? onActionButtonTap, onBackPress;
  final double? actionButtonWidth;
  final Widget? titleWidget, leading, bottom;
  final bool addBackButton;
  final bool centerTitle;

  CustomAppbarWidget({
    Key? key,
    this.title,
    this.titleWidget,
    this.leading,
    this.addBackButton = true,
    this.onBackPress,
    this.backgroundColor,
    this.backButtonColor,
    this.textColor,
    this.textStyle,
    this.actions,
    this.onActionButtonTap,
    this.actionButtonWidth = 100,
    this.bottom,
    this.centerTitle = false,
  })  : assert(
          textColor == null || textStyle == null,
          'Cannot provide both a textColor and a textStyle\n'
          'To provide both, use "textStyle: TextStyle(color: color)".',
        ),
        super(
          key: key,
          child: const SizedBox.shrink(),
          preferredSize:
              Size.fromHeight(bottom == null ? kToolbarHeight : AppSize.s100),
        );

  @override
  Widget build(BuildContext context) {
    backgroundColor ??= ColorManager.backgroundColor;
    backButtonColor ??= ColorManager.black;

    return AppBar(
      centerTitle: centerTitle,
      elevation: 0,
      actions: actions,
      actionsIconTheme: const IconThemeData(
        size: AppSize.s20,
      ),
      bottom: bottom == null
          ? null
          : PreferredSize(
              preferredSize: const Size.fromHeight(AppSize.s100),
              child: bottom!,
            ),
      leading: addBackButton
          ? CustomIconButton(
              icon: leading,
              onTap: onBackPress,
              buttonColor: backButtonColor,
            )
          : null,
      leadingWidth: AppSize.s40,
      backgroundColor: backgroundColor,
      title: title == null
          ? (titleWidget ?? const SizedBox.shrink())
          : Text(
              title ?? "",
              style: textStyle ??
                  getRegularStyle(
                    color: textColor ??
                        (backgroundColor == ColorManager.white
                            ? ColorManager.lightGrey
                            : Colors.black),
                    fontSize: FontSize.s16,
                  ),
            ),
    );
  }
}
