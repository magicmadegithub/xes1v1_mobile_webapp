import 'package:flutter/material.dart';
import 'package:xes1v1mobileweb/common/strings.dart';
import 'package:xes1v1mobileweb/common/text_styles.dart';

class AppBarUtils {
  static int _selectedIndex = 0;

  static List<Color> menuTextColors = [
    Colors.red,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black
  ];

  static void handleMenuTextColor() {
    for (int i = 0; i < menuTextColors.length; i++) {
      if (i == _selectedIndex) {
        menuTextColors[i] = Colors.red;
      } else {
        menuTextColors[i] = Colors.black;
      }
    }
  }

  static Widget createAppBar(BuildContext context, Function clickCallback) {
    return AppBar(
        titleSpacing: 0.0,
        title: _buildTitle(),
        elevation: 0.0,
        backgroundColor: Color(0xF9F9F9),
        actions: _buildActions(context, clickCallback));
  }

  static Widget _buildTitle() {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(
            text: Strings.xueersi,
            style: TextStyles.logo1,
          ),
          TextSpan(
            text: Strings.onevone,
            style: TextStyles.logo2,
          ),
        ],
      ),
    );
  }

  static List<Widget> _buildActions(
      BuildContext context, Function clickCallback) {
    return <Widget>[
      MaterialButton(
        child: Text(
          Strings.menu_article,
          style: TextStyles.menu_item.copyWith(
            color: menuTextColors[0],
          ),
        ),
        onPressed: () {
          if (clickCallback != null) {
            _selectedIndex = 0;
            handleMenuTextColor();
            clickCallback(_selectedIndex);
          }
        },
      ),
      MaterialButton(
        child: Text(
          Strings.menu_frame,
          style: TextStyles.menu_item.copyWith(color: menuTextColors[1]),
        ),
        onPressed: () {
          _selectedIndex = 1;
          handleMenuTextColor();
          clickCallback(_selectedIndex);
        },
      ),
      MaterialButton(
        child: Text(
          Strings.menu_course,
          style: TextStyles.menu_item.copyWith(color: menuTextColors[2]),
        ),
        onPressed: () {
          _selectedIndex = 2;
          handleMenuTextColor();
          clickCallback(_selectedIndex);
        },
      ),
      MaterialButton(
        child: Text(
          Strings.menu_honor,
          style: TextStyles.menu_item.copyWith(color: menuTextColors[3]),
        ),
        onPressed: () {
          _selectedIndex = 3;
          handleMenuTextColor();
          clickCallback(_selectedIndex);
        },
      ),
      MaterialButton(
        child: Text(
          Strings.menu_about,
          style: TextStyles.menu_item.copyWith(color: menuTextColors[4]),
        ),
        onPressed: () {
          _selectedIndex = 4;
          handleMenuTextColor();
          clickCallback(_selectedIndex);
        },
      ),
    ];
  }
}
