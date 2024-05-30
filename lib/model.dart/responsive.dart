import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  const Responsive({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);
//this size worke fine on my design, mybe you need some custmoization depends on you design
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 900 &&
      MediaQuery.of(context).size.width >= 650;
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width < 900;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      // if our width its less then 900 and more then we consider desktop
      builder: (context, constraints) {
        if (constraints.maxWidth >= 900) {
          return desktop;
        }
        // if width it less then 900 and more 650 we consider
        else if (constraints.maxWidth >= 650) {
          return tablet;
        }
        // our less then that we called it mobile
        else {
          return mobile;
        }
      },
    );
  }
}
