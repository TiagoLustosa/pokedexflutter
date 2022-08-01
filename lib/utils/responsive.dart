import 'package:flutter/cupertino.dart';

class Responsive {
  final BuildContext context;

  Responsive(this.context);

  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;

  bool get isMobile => MediaQuery.of(context).size.width < 600;
  bool get isTablet =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 1200;
  bool get isDesktop => MediaQuery.of(context).size.width >= 1200;
  Orientation get orientation => MediaQuery.of(context).orientation;

  double fontSize(double size) {
    if (isMobile) {
      return size;
    } else if (isTablet) {
      return size * 1.2;
    } else {
      return size * 2.0;
    }
  }

  double padding(double size) {
    if (isMobile) {
      return size;
    } else if (isTablet) {
      return size * 1.2;
    } else {
      return size * 2.0;
    }
  }
}
