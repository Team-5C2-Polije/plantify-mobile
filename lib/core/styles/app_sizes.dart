import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSizes {
  // Faktor Pengali dan Pengurang Ukuran Teks
  static double fontMultScaleFactor = 1.0;
  static double fontReduceScaleFactor = 1.0;

  // Faktor Pengali dan Pengurang Ukuran
  static double paddingMultScaleFactor = 1.0;
  static double paddingReduceScaleFactor = 1.0;

  static double marginMultScaleFactor = 1.0;
  static double marginReduceScaleFactor = 1.2;

  static double buttonMultScaleFactor = 1.0;
  static double buttonReduceScaleFactor = 1.0;

  static double ukuranListViewHorizontal = (240).h;

  static double screenWidth = 0;
  static double screenHeight = 0;

  // Variabel untuk scaling
  static double initSize = 1.0;

  static void init(BuildContext context, double size) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    initSize = size;
  }

  // Ukuran Teks
  static double get textDisplayLarge => _calculateTextSize(48);
  static double get textDisplayMedium => _calculateTextSize(34);
  static double get textDisplaySmall => _calculateTextSize(24);
  static double get textHeadlineLarge => _calculateTextSize(22);
  static double get textHeadlineMedium => _calculateTextSize(20);
  static double get textHeadlineSmall => _calculateTextSize(18);
  static double get textTitleLarge => _calculateTextSize(16);
  static double get textTitleMedium => _calculateTextSize(14);
  static double get textTitleSmall => _calculateTextSize(12);
  static double get textBodyLarge => _calculateTextSize(10);
  static double get textBodyMedium => _calculateTextSize(8);
  static double get textBodySmall => _calculateTextSize(6);
  static double get textLabelLarge => _calculateTextSize(14);
  static double get textLabelMedium => _calculateTextSize(12);
  static double get textLabelSmall => _calculateTextSize(10);
  static double get textExtraSmall => _calculateTextSize(10);
  static double get textSmall => _calculateTextSize(12);
  static double get textRegular => _calculateTextSize(14);
  static double get textMedium => _calculateTextSize(16);
  static double get textLarge => _calculateTextSize(18);
  static double get textExtraLarge => _calculateTextSize(20);
  static double get textHuge => _calculateTextSize(24);

  // Padding
  static EdgeInsets get paddingSuperSmall => _calculatePadding(2);
  static EdgeInsets get paddingExtraSmall => _calculatePadding(4);
  static EdgeInsets get paddingSmall => _calculatePadding(8);
  static EdgeInsets get paddingSmallMedium => _calculatePadding(12);
  static EdgeInsets get paddingMedium => _calculatePadding(16);
  static EdgeInsets get paddingMediumLarge => _calculatePadding(20);
  static EdgeInsets get paddingLarge => _calculatePadding(24);
  static EdgeInsets get paddingExtraLarge => _calculatePadding(28);
  static EdgeInsets get paddingSuperLarge => _calculatePadding(32);
  static EdgeInsets get paddingContentQuiz => EdgeInsets.only(
    top: distanceSmall.h,
    left: distanceSmallMedium.w,
    right: distanceSmallMedium.w,
    bottom: distanceMediumLarge.h,
  );
  static EdgeInsets get paddingContentQuizLarge => EdgeInsets.only(
    top: distanceMedium,
    left: distanceMedium,
    right: distanceMedium.w,
    bottom: distanceLarge.h,
  );

  static EdgeInsets get paddingOnlyHorSmallMedium =>
      EdgeInsets.symmetric(horizontal: _calculatePaddingValue(8).w);
  static EdgeInsets get paddingOnlyVerSmallMedium =>
      EdgeInsets.symmetric(vertical: _calculatePaddingValue(8).h);

  static EdgeInsets get paddingHorSmall => _calculateSymmetricPadding(12, 2);
  static EdgeInsets get paddingHorSmallMedium =>
      _calculateSymmetricPadding(16, 4);
  static EdgeInsets get paddingHorMedium => _calculateSymmetricPadding(20, 4);
  static EdgeInsets get paddingHorMediumLarge =>
      _calculateSymmetricPadding(24, 4);

  // Margin
  static EdgeInsets get marginExtraSmall => _calculateMargin(4);
  static EdgeInsets get marginSmall => _calculateMargin(8);
  static EdgeInsets get marginRegular => _calculateMargin(12);
  static EdgeInsets get marginMedium => _calculateMargin(16);
  static EdgeInsets get marginLarge => _calculateMargin(20);
  static EdgeInsets get marginExtraLarge => _calculateMargin(24);

  // Ukuran Tombol
  static Size get buttonSmall => _calculateButtonSize(100, 40);
  static Size get buttonRegular => _calculateButtonSize(150, 50);
  static Size get buttonLarge => _calculateButtonSize(200, 60);

  // Radius untuk Border
  static double radiusScaleFactor = 1.0;

  static BorderRadius get radiusSuperSmall => _calculateBorderRadius(2);
  static BorderRadius get radiusExtraSmall => _calculateBorderRadius(4);
  static BorderRadius get radiusSmall => _calculateBorderRadius(8);
  static BorderRadius get radiusSmallMedium => _calculateBorderRadius(12);
  static BorderRadius get radiusMedium => _calculateBorderRadius(16);
  static BorderRadius get radiusMediumLarge => _calculateBorderRadius(20);
  static BorderRadius get radiusLarge => _calculateBorderRadius(24);
  static BorderRadius get radiusExtraLarge => _calculateBorderRadius(28);
  static BorderRadius get radiusSuperLarge => _calculateBorderRadius(32);

  static Radius get onlyRadiusSmall => _calculateRadius(8);
  static Radius get onlyRadiusSmallMedium => _calculateRadius(12);
  static Radius get onlyRadiusMediumLarge => _calculateRadius(20);
  static Radius get onlyRadiusSuperLarge => _calculateRadius(32);
  static Radius get onlyRadiusVerySuperLarge => _calculateRadius(60);

  static Border get borderSmallBlack =>
      Border.all(color: Colors.black, width: 2.w * initSize);
  static Border get borderMediumBlack =>
      Border.all(color: Colors.black, width: 4.w * initSize);

  // Konstanta Lainnya
  static const double distanceSuperSmall = 2.0;
  static const double distanceExtraSmall = 4.0;
  static const double distanceSmall = 8.0;
  static const double distanceSmallMedium = 12.0;
  static const double distanceMedium = 16.0;
  static const double distanceMediumLarge = 20.0;
  static const double distanceLarge = 24.0;
  static const double distanceExtraLarge = 28.0;
  static const double distanceSuperLarge = 32.0;

  static const double profileImageSize = 120.0;
  static const double iconSize = 24.0;
  static const double expandedProfile = 200.0;
  static const double buttonRadius = 20.0;
  static const double cardCoursePhoto = 40.0;
  static const double cardSearch = 100.0;
  static const double bottomExtra = 100.0;
  static const double radiusCollection = 60.0;
  static const double backButtonPosition = 10.0;

  static double myCollectionButtonSize = 50.h * initSize;

  static const double lottieTopVideoSize = 38.0;
  static const double lottieSelectVideo = 36.0;
  static const double lottieTopVideoTextSize = 28.0;
  static const double circleButtonSize = 21.0;
  static const double progressCircleButton = 18.0;
  static const double circleProgressSize = 42.0;
  static const double emoTripleLottie = 32.0;
  static const double thicknessCourse = 12.0;
  static const double sizeColorItem = 40.0;
  static const double sizeStatisticCard = 46;
  static const double sizeIconRemoveCollection = 30;

  // Helper Methods
  static double _calculateTextSize(double baseSize) =>
      (baseSize * fontMultScaleFactor / fontReduceScaleFactor * initSize).sp;

  static EdgeInsets _calculatePadding(double baseSize) => EdgeInsets.all(
      (baseSize * paddingMultScaleFactor / paddingReduceScaleFactor * initSize)
          .w);

  static double _calculatePaddingValue(double baseSize) =>
      baseSize * paddingMultScaleFactor / paddingReduceScaleFactor * initSize;

  static EdgeInsets _calculateSymmetricPadding(
      double horizontal, double vertical) =>
      EdgeInsets.symmetric(
          horizontal: (horizontal *
              paddingMultScaleFactor /
              paddingReduceScaleFactor *
              initSize)
              .w,
          vertical: (vertical *
              paddingMultScaleFactor /
              paddingReduceScaleFactor *
              initSize)
              .h);

  static EdgeInsets _calculateMargin(double baseSize) => EdgeInsets.all(
      (baseSize * marginMultScaleFactor / marginReduceScaleFactor * initSize)
          .w);

  static Size _calculateButtonSize(double width, double height) => Size(
      (width * buttonMultScaleFactor / buttonReduceScaleFactor * initSize).w,
      (height * buttonMultScaleFactor / buttonReduceScaleFactor * initSize).h);

  static BorderRadius _calculateBorderRadius(double radius) =>
      BorderRadius.circular(radius * radiusScaleFactor * initSize.r);

  static Radius _calculateRadius(double radius) =>
      Radius.circular(radius * radiusScaleFactor * initSize.r);

  // from tutor app
  static double sizeTextHeaderGlobal = 25.0;
  static double sizeTextDescriptionGlobal = sizeTextHeaderGlobal - 10;
  static double topBar = 100.h;

  static double sizeBorderBlackGlobal = 2.0;
  static double sizeRoundedGlobal = 10;
  static double sizeMarginLeftTittle = 20.0;
  static double marginTopAndBottom = 30.0;

  static double roundedCircularGlobal = sizeRoundedGlobal;

  // Helper method untuk menghitung ukuran icon berdasarkan MediaQuery
  static double _iconSizeWithMediaQuery(BuildContext context, double baseIconSize) {
    double screenWidth = MediaQuery.of(context).size.width;
    // Menyesuaikan ukuran icon relatif terhadap lebar dasar 375px
    return baseIconSize * (screenWidth / 375);
  }
  static double iconMedium(BuildContext context) => _iconSizeWithMediaQuery(context, 24);
}
