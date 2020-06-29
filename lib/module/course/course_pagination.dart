import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CustomPagination extends StatelessWidget {
  final SwiperPluginConfig _config;

  CustomPagination(this._config);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          bottom: 10,
          left: 10,
          right: 10,
          child: Container(
            height: 9,
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _dots(),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _dots() {
    List<Widget> dotsItems = [];
    double itemSpace = 5.0;
    for (int i = 0; i < _config.itemCount; i++) {
      Widget d = new Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: (i == _config.activeIndex)
              ? Color(0xE6FFFFFF)
              : Color(0x80FFFFFF),
        ),
        width: 20,
        height: 20,
        margin: EdgeInsets.only(left: (i == 0 ? 0 : itemSpace)),
      );
      dotsItems.add(d);
    }
    return dotsItems;
  }
}
