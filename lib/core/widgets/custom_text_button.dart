import 'package:cv/core/utils/utils_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? title;
  final double height;
  final double? buttonWidth, textFontSize;
  final Widget? child;
  Color? buttonColor;
  final bool addBorder;
  final double radius;
  final EdgeInsets padding;

  CustomTextButton({
    Key? key,
    required this.onPressed,
    this.title,
    this.height = 40,
    this.child,
    this.buttonColor,
    this.buttonWidth,
    this.textFontSize,
    this.addBorder = false,
    this.radius = 12,
    this.padding = EdgeInsets.zero,
  })  : assert(
          title == null || child == null,
          'Cannot provide both a title and a child\n'
          'To provide both, use "child: Text(title)".',
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    buttonColor ??= ColorManager.primaryColor;

    return TextButton(
      onPressed: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild?.unfocus();
        }

        if(onPressed!= null){
          onPressed!();
        }
      },
      // style: ThemeData().textButtonTheme.style!.copyWith(
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.resolveWith<Size>(
              (states) => buttonWidth == null
                  ? Size.fromHeight(height)
                  : Size(
                      buttonWidth!,
                      height,
                    ),
            ),
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return buttonColor == Colors.transparent ||
                          buttonColor == ColorManager.white
                      ? ColorManager.primaryColor.withOpacity(.24)
                      : Colors.white.withOpacity(.14);
                }

                return null;
              },
            ),
            shape: !addBorder && radius == 12
                ? ThemeData().textButtonTheme.style!.shape
                : MaterialStateProperty.resolveWith<RoundedRectangleBorder>(
                    (states) => RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(radius),
                      side: addBorder
                          ? BorderSide(
                              color: ColorManager.primaryColor == buttonColor
                                  ? ColorManager.white
                                  : ColorManager.primaryColor,
                              width: 1,
                            )
                          : BorderSide.none,
                    ),
                  ),
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return ColorManager.lightGrey;
                }

                return buttonColor!;
              },
            ),
            padding: MaterialStateProperty.all(padding),
          ),
      child: child ??
          Text(
            title ?? "",
            style: getMediumStyle(
              fontSize: textFontSize ?? FontSize.s14,
              color: buttonColor == ColorManager.white ||
                      buttonColor == Colors.transparent
                  ? ColorManager.primaryColor
                  : ColorManager.white,
            ),
          ),
    );
  }
}
