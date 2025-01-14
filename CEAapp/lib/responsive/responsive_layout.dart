import 'package:flutter/material.dart';
import 'package:test01/responsive/dimensions.dart';

class responsiveLayout extends StatelessWidget {
  // const responsiveLayout({super.key});

  final Widget mobileScreen;
  final Widget tabletScreen;

  responsiveLayout({required this.mobileScreen, required this.tabletScreen});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < mobileWidth) {
          return mobileScreen;
        } else {
          return tabletScreen;
        }
      },
    );
  }
}
