import '../constants/constant_path.dart';

class _AssetsImagesGen {
  const _AssetsImagesGen();

  String get logo => '$kImagesPath/logo.png';
  String get profile => '$kImagesPath/profile.png';
}

class _AssetsSvgImagesGen {
  const _AssetsSvgImagesGen();

  String get phone => '$kSvgImagesPath/phone.svg';
  String get myprofile => '$kSvgImagesPath/myprofile.svg';
  String get longback => '$kSvgImagesPath/longback.svg';
}

class Assets {
  Assets._();
  static const images = _AssetsImagesGen();
  static const svgImages = _AssetsSvgImagesGen();
}
