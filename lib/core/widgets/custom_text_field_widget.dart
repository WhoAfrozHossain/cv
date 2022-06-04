import 'package:cv/core/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class CustomTextFieldWidget extends StatelessWidget {
  final String? labelText, hintText;
  final String? initialValue, prefixText, suffixText;
  final Widget? prefixIcon, suffixIcon;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final ValueChanged<String?>? onChanged, onSaved;
  final int? maxLength, maxLines;
  final int minLines;
  final bool readOnly, addHint, enabled;
  final bool? isDense;
  final Function()? onTap;
  final InputBorder? border;
  final AutovalidateMode autovalidateMode;
  final BoxConstraints? suffixIconConstraints;
  final EdgeInsets? prefixIconPadding;
  Color? fillColor;

  CustomTextFieldWidget({
    Key? key,
    this.labelText,
    this.hintText,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.onSaved,
    this.maxLength,
    this.maxLines,
    this.minLines = 1,
    this.initialValue,
    this.readOnly = false,
    this.onTap,
    this.border,
    this.enabled = true,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.addHint = false,
    this.suffixIconConstraints,
    this.prefixText,
    this.suffixText,
    this.isDense,
    this.prefixIconPadding,
    this.fillColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = getRegularStyle(
      color: ColorManager.lightGrey,
      fontSize: FontSize.s14,
    );

    fillColor ??= ColorManager.white;

    return TextFormField(
      onTap: onTap,
      readOnly: readOnly,
      initialValue: initialValue,
      keyboardType: keyboardType,
      autovalidateMode: autovalidateMode,
      controller: controller,
      onChanged: onChanged,
      minLines: minLines,
      maxLines: maxLines,
      onSaved: onSaved,
      enabled: enabled,
      inputFormatters: maxLength == null
          ? null
          : [
              LengthLimitingTextInputFormatter(maxLength),
              if (keyboardType == TextInputType.number)
                FilteringTextInputFormatter.digitsOnly,
            ],
      decoration: InputDecoration(
        fillColor: fillColor,
        filled: fillColor != null,
        isDense: isDense,
        border: border,
        enabledBorder: border,
        focusedBorder: border,
        labelText: addHint
            ? null
            : ((controller?.text != null || !readOnly) ? labelText : null),
        hintText: hintText,
        prefixIconConstraints: const BoxConstraints(
          maxHeight: 40,
          maxWidth: 40,
        ),
        prefixIcon: prefixIcon == null
            ? null
            : Padding(
                padding: prefixIconPadding ?? const EdgeInsets.only(left: 10),
                child: prefixIcon,
              ),
        prefixText: prefixText,
        suffixText: suffixText,
        prefixStyle: textStyle,
        suffixStyle: textStyle,
        suffixIcon: suffixIcon == null
            ? null
            : Padding(
                padding: const EdgeInsets.only(right: 10),
                child: suffixIcon,
              ),
        suffixIconConstraints: suffixIconConstraints ??
            const BoxConstraints(
              maxHeight: 40,
              maxWidth: 40,
            ),
      ),
    );
  }
}
