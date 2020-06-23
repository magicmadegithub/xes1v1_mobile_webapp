import 'package:flutter/material.dart';
import 'package:xes1v1mobileweb/common/strings.dart';
import 'package:xes1v1mobileweb/common/text_styles.dart';
import 'package:xes1v1mobileweb/widgets/appbar_utils.dart';

class HomeWeb extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeWebState();
  }
}

class HomeWebState extends State<HomeWeb> {

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: EdgeInsets.only(left: 220, right: 220),
        child: Scaffold(
          appBar: AppBarUtils.createAppBar(context,(){
            setState(() {

            });
          }),
          body: Container(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
