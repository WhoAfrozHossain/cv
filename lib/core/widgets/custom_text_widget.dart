import 'package:flutter/material.dart';
import 'package:cv/core/utils/utils_export.dart';
import 'package:flutter_html/flutter_html.dart' as html;

class CustomTextWidget extends StatelessWidget {
  final String text;
  final TextAlign? align;
  final int? maxLine;
  final bool? isFullWidth;
  final TextStyle? style;
  final bool isHtml;

  const CustomTextWidget({
    Key? key,
    required this.text,
    this.align,
    this.maxLine,
    this.isFullWidth,
    this.style,
    this.isHtml = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
      constraints: BoxConstraints(
        minWidth: isFullWidth == null
            ? 0
            : isFullWidth!
                ? double.infinity
                : 10,
      ),
      child: isHtml
          ? html.Html(
              shrinkWrap: true,
              data: text,
            )
          : Text(
              text,
              maxLines: maxLine,
              // overflow: TextOverflow.ellipsis,
              style: style ??
                  getRegularStyle(
                    color: ColorManager.black,
                    fontSize: FontSize.s14,
                  ),
              textAlign: align ?? TextAlign.justify,
            ),
    );
  }
}
