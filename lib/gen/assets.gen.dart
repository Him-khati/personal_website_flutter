/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/abstract_wallpaper_image.jpg
  AssetGenImage get abstractWallpaperImage =>
      const AssetGenImage('assets/images/abstract_wallpaper_image.jpg');

  /// File path: assets/images/android_dd.jpeg
  AssetGenImage get androidDd =>
      const AssetGenImage('assets/images/android_dd.jpeg');

  /// File path: assets/images/avatar_person.png
  AssetGenImage get avatarPerson =>
      const AssetGenImage('assets/images/avatar_person.png');

  /// File path: assets/images/ic_github.svg
  String get icGithub => 'assets/images/ic_github.svg';

  /// File path: assets/images/ic_linked_in_64x.png
  AssetGenImage get icLinkedIn64x =>
      const AssetGenImage('assets/images/ic_linked_in_64x.png');

  /// File path: assets/images/ic_stack_overflow_64x.png
  AssetGenImage get icStackOverflow64x =>
      const AssetGenImage('assets/images/ic_stack_overflow_64x.png');

  /// File path: assets/images/image_himanshu.png
  AssetGenImage get imageHimanshu =>
      const AssetGenImage('assets/images/image_himanshu.png');

  /// List of all assets
  List<dynamic> get values => [
        abstractWallpaperImage,
        androidDd,
        avatarPerson,
        icGithub,
        icLinkedIn64x,
        icStackOverflow64x,
        imageHimanshu
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size = null});

  final String _assetName;

  final Size? size;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
