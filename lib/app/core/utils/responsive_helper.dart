import 'package:flutter/material.dart';
import '../values/app_values.dart';

class ResponsiveHelper {
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < AppValues.mobileBreakpoint;
  }

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= AppValues.mobileBreakpoint &&
        width < AppValues.tabletBreakpoint;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= AppValues.tabletBreakpoint;
  }

  static double getResponsivePadding(BuildContext context) {
    if (isMobile(context)) return AppValues.paddingMedium;
    if (isTablet(context)) return AppValues.paddingLarge;
    return AppValues.paddingXLarge;
  }

  static double getResponsiveFontSize(
    BuildContext context, {
    required double mobile,
    required double tablet,
    required double desktop,
  }) {
    if (isMobile(context)) return mobile;
    if (isTablet(context)) return tablet;
    return desktop;
  }
}
