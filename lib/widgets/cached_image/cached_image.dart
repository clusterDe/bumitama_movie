// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:bumitama_movie/repository/api/api_repository.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({
    super.key,
    this.url,
    this.errorImage,
    this.blendMode,
    this.color,
  });

  final String? url;
  final Widget? errorImage;
  final BlendMode? blendMode;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: '$url',
      memCacheHeight: 1200,
      memCacheWidth: 1200,
      color: color,
      httpHeaders: header,
      colorBlendMode: blendMode,
      progressIndicatorBuilder: (context, url, downloadProgress) {
        return Center(
          child: CircularProgressIndicator.adaptive(
            value: downloadProgress.progress,
          ),
        );
      },
      errorWidget: (context, url, error) {
        if (errorImage != null) {
          return errorImage!;
        } else {
          return const Icon(
            Icons.error_outline,
          );
        }
      },
      errorListener: (value) {
        print('error image : $value');
      },
      fit: BoxFit.cover,
    );
  }
}
