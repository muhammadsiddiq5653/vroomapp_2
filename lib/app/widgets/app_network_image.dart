import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class AppNetworkImage extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Widget? loadingWidget;
  final Alignment alignment;
  AppNetworkImage(
      {required this.url,
      this.width,
      this.height,
      this.fit,
      this.alignment = Alignment.center,
      this.loadingWidget});
  @override
  Widget build(BuildContext context) {
    return ExtendedImage.network(
      url,
      alignment: alignment,
      width: width,
      height: height,
      fit: fit,
      cache: true,
      loadStateChanged: (state) {
        if (state.extendedImageLoadState == LoadState.loading &&
            loadingWidget != null) return loadingWidget;
        if (state.extendedImageLoadState == LoadState.failed &&
            loadingWidget != null) return loadingWidget;
      },
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
    );
  }
}
