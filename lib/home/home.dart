import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'home_mobile.dart';
import 'home_web.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      breakpoints: ScreenBreakpoints(desktop: 900, tablet: 650, watch: 250),
      mobile: OrientationLayoutBuilder(
        portrait: (context) => HomeMobilePortrait(),
        landscape: (context) => HomeMobileLandscape(),
      ),
      tablet: HomeWeb(),
    );
  }
}
