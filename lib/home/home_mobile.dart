/// Contains the widgets that will be used for Mobile layout of home,
/// portrait and landscape

import 'package:flutter/material.dart';
import 'package:xes1v1mobileweb/common/strings.dart';
import 'package:xes1v1mobileweb/module/about/about_mobile_portrait.dart';
import 'package:xes1v1mobileweb/module/article/article_mobile_portrait.dart';
import 'package:xes1v1mobileweb/module/course/course_mobile_portrait.dart';
import 'package:xes1v1mobileweb/module/frame/frame_mobile_portrait.dart';
import 'package:xes1v1mobileweb/module/honor/honor_mobile_portrait.dart';
import 'package:xes1v1mobileweb/widgets/drawer_utils.dart';

class HomeMobilePortrait extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeMobilePortraitState();
  }
}
class HomeMobilePortraitState extends State<HomeMobilePortrait> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  static String _currentMenu = Strings.menu_article;
  static int _selectedIndex = 0;
  final tabs = [
    ArticleMobilePortrait(),
    FrameMobilePortrait(),
    CourseMobilePortrait(),
    HonorMobilePortrait(),
    AboutMobilePortrait(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(_currentMenu),
        backgroundColor: Colors.red,
      ),
      drawer: Drawer(
        child: DrawerUtils.buildDrawer(context,(index,menu) {
          setState(() {
            _selectedIndex = index;
            _currentMenu = menu;
          });
        })),
      body: IndexedStack(
            index: _selectedIndex,
            children: tabs,
          )
      );

  }

}



class HomeMobileLandscape extends StatelessWidget {
  const HomeMobileLandscape({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[],
      ),
    );
  }
}




