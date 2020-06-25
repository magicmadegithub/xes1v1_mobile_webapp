import 'package:flutter/material.dart';
import 'package:xes1v1mobileweb/module/about/about.dart';
import 'package:xes1v1mobileweb/module/article/article.dart';
import 'package:xes1v1mobileweb/module/course/course.dart';
import 'package:xes1v1mobileweb/module/frame/frame.dart';
import 'package:xes1v1mobileweb/module/honor/honor.dart';
import 'package:xes1v1mobileweb/widgets/appbar_utils.dart';

class HomeWeb extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeWebState();
  }
}

class HomeWebState extends State<HomeWeb> {
  int _index = 0;

  final List<Widget> tabs = [
    Article(),
    Frame(),
    Course(),
    Honor(),
    About(),
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: EdgeInsets.only(left: 220, right: 220),
        child: Scaffold(
          appBar: AppBarUtils.createAppBar(context, (index) {
            setState(() {
              _index = index;
            });
          }),
          body: IndexedStack(
            index: _index,
            children: tabs,
          ),
        ),
      ),
    );
  }
}
