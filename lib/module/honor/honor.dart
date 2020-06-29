import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:xes1v1mobileweb/common/text_styles.dart';
import 'package:xes1v1mobileweb/module/honor/honor_trophy.dart';
import 'package:xes1v1mobileweb/net/models/honor_list_entity.dart';
import 'package:xes1v1mobileweb/net/net_url.dart';
import 'package:xes1v1mobileweb/net/net_utils.dart';

class Honor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HonorState();
  }
}

class HonorState extends State<Honor> {
  List<HonorEntity> _list = [];

  @override
  void initState() {
    super.initState();
    NetUtils.instance.get(NetUrl.honorList, onData: (data) {
      HonorListEntity result = HonorListEntity.fromJson(data);
      if (result.code == 0) {
        setState(() {
          _list = result.data;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(left: 100, top: 20, bottom: 20),
      child: HonorTrophyWidget(
        children: _buildItem(),
        menu: Container(
          width: 250,
          height: 250,
          color: Color(0xFFFAFAFA),
          child: Image.asset(
            'images/honor_trophy.png',
          ),
        ),
      ),
    );
  }

  List<Widget> _buildItem() {
    List<Widget> _widgetList = [];
    for (HonorEntity honor in _list) {
      _widgetList.add(Container(
        child: Container(
          width: 200,
          height: 200,
          padding: EdgeInsets.all(3),
          child: Image.network(honor.imgurl),
        ),
      ));
    }
    return _widgetList;
  }
}
