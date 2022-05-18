// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cv/common/util/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:octo_image/octo_image.dart';

class CustomImageWidget extends StatelessWidget {
  final BuildContext context;
  String? imageUrl;
  final Size? size;
  final double? height, radius;
  final BorderRadius? borderRadius;
  final Color? color;
  final BoxFit? fit;

  CustomImageWidget({
    Key? key,
    required this.context,
    this.imageUrl,
    this.size,
    this.radius,
    this.borderRadius,
    this.color,
    this.height,
    this.fit,
  })  : assert(
          borderRadius == null || radius == null,
          'Cannot provide both a borderRadius and a radius\n',
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imageUrl != null &&
        (imageUrl!.contains("public") ||
            imageUrl!.contains("uploads") ||
            imageUrl!.contains("storage"))) {
      if (!imageUrl!.contains("http")) {
        imageUrl = Constants.imageBaseUrl + imageUrl!;
      }
    }

    return (radius != null || borderRadius != null)
        ? ClipRRect(
            borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 0),
            child: child,
          )
        : child;
  }

  Widget get child => imageUrl == null ||
          (imageUrl != null && imageUrl!.isEmpty)
      ? placeholder
      : (Uri.tryParse(imageUrl ?? Constants.dummyImageUrl)?.hasAbsolutePath ??
                  false) ||
              imageUrl!.startsWith('http') ||
              (!imageUrl!.startsWith('asset') && kIsWeb)
          ? OctoImage(
              image: CachedNetworkImageProvider(
                imageUrl ?? Constants.dummyImageUrl,
              ),
              placeholderBuilder: OctoPlaceholder.blurHash(
                Constants.placeHolderBlurHash,
              ),
              errorBuilder: (context, error, stackTrace) {
                return placeholder;
              },
              fit: fit ?? BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              color: color,
            )
          : (File(imageUrl!).existsSync()
              ? Image.file(
                  File(imageUrl!),
                  width: size?.width,
                  height: height ?? size?.height,
                  fit: BoxFit.cover,
                )
              : placeholder);

  Widget get placeholder => Icon(
        Icons.error,
        size: size?.width,
      );
}
