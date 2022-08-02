import 'package:flutter/cupertino.dart';

class Responsive {
  final BuildContext context;

  Responsive(this.context);

  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;

  bool get isMobile => MediaQuery.of(context).size.width < 450;
  bool get isLargeMobile =>
      MediaQuery.of(context).size.width >= 450 &&
      MediaQuery.of(context).size.width < 600;
  bool get isTablet =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 1200;
  bool get isDesktop => MediaQuery.of(context).size.width >= 1200;
  bool get isLandscape =>
      MediaQuery.of(context).orientation == Orientation.landscape;
  int get crossAxisCount {
    if (isMobile) {
      return 2;
    } else if (isLargeMobile) {
      return 2;
    } else if (isTablet) {
      return 5;
    } else {
      return 6;
    }
  }
}
