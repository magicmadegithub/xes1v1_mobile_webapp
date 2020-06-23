import 'package:flutter/material.dart';
import 'package:xes1v1mobileweb/common/strings.dart';
import 'package:xes1v1mobileweb/common/text_styles.dart';

class HomeWeb extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeWebState();
  }
}

class HomeWebState extends State<HomeWeb> {

  int _selectedIndex = 0;

  List<Color> menuTextColors = [
    Colors.red,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black
  ];

  void handleMenuTextColor() {
    for (int i = 0; i < menuTextColors.length; i++) {
      if (i == _selectedIndex) {
        menuTextColors[i] = Colors.red;
      } else {
        menuTextColors[i] = Colors.black;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: EdgeInsets.only(left: 220, right: 220),
        child: Scaffold(
          appBar: _buildAppBar(context),
          body: Container(
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
        titleSpacing: 0.0,
        title: _buildTitle(),
        elevation: 0.0,
        backgroundColor: Color(0xF9F9F9),
        actions: _buildActions(context));
  }

  Widget _buildTitle() {
    return RichText(
      text: TextSpan(
        // Note: Styles for TextSpans must be explicitly defined.
        // Child text spans will inherit styles from parent
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

  List<Widget> _buildActions(BuildContext context) {
    return <Widget>[
      MaterialButton(
        child: Text(
          Strings.menu_article,
          style: TextStyles.menu_item.copyWith(
            color: menuTextColors[0],
          ),
        ),
        onPressed: () {
          setState(() {
            _selectedIndex = 0;
            handleMenuTextColor();
          });
        },
      ),
      MaterialButton(
        child: Text(
          Strings.menu_frame,
          style: TextStyles.menu_item.copyWith(color: menuTextColors[1]),
        ),
        onPressed: () {
          setState(() {
            _selectedIndex = 1;
            handleMenuTextColor();
          });
        },
      ),
      MaterialButton(
        child: Text(
          Strings.menu_course,
          style: TextStyles.menu_item.copyWith(color: menuTextColors[2]),
        ),
        onPressed: () {
          setState(() {
            _selectedIndex = 2;
            handleMenuTextColor();
          });
        },
      ),
      MaterialButton(
        child: Text(
          Strings.menu_honor,
          style: TextStyles.menu_item.copyWith(color: menuTextColors[3]),
        ),
        onPressed: () {
          setState(() {
            _selectedIndex = 3;
            handleMenuTextColor();
          });
        },
      ),
      MaterialButton(
        child: Text(
          Strings.menu_about,
          style: TextStyles.menu_item.copyWith(color: menuTextColors[4]),
        ),
        onPressed: () {
          setState(() {
            _selectedIndex = 4;
            handleMenuTextColor();
          });
        },
      ),
    ];
  }
}
