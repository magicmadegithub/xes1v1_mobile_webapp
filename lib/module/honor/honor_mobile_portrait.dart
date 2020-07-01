import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:xes1v1mobileweb/common/text_styles.dart';
import 'package:xes1v1mobileweb/module/honor/honor_trophy.dart';
import 'package:xes1v1mobileweb/net/models/honor_list_entity.dart';
import 'package:xes1v1mobileweb/net/net_url.dart';
import 'package:xes1v1mobileweb/net/net_utils.dart';

class HonorMobilePortrait extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HonorState();
  }
}

class HonorState extends State<HonorMobilePortrait> {
  List<HonorEntity> _list = [];

  @override
  void initState() {
    super.initState();
    NetUtils.instance.get(NetUrl.honorList, onData: (data) {
      HonorListEntity result = HonorListEntity.fromJson(data);
      if (result.code == 0) {
        _list = result.data;
        _list.sort((a, b) => (b.id).compareTo(a.id));
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100),
      child: HonorTrophyWidget(
        children: _buildItem(context),
        menu: Container(
          width: 180,
          height: 180,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFFAFAFA),
          ),
          child: Image.asset(
            'images/honor_trophy.png',
          ),
        ),
      ),
    );
  }

  List<Widget> _buildItem(BuildContext context) {
    List<Widget> _widgetList = [];
    for (HonorEntity honor in _list) {
      _widgetList.add(Container(
        child: InkWell(
          splashColor: Color(0x00000000),
          focusColor: Color(0x00000000),
          highlightColor: Color(0x00000000),
          hoverColor: Color(0x00000000),
          onTap: () {
            honorDialog(context, honor.title, honor.info, honor.imgurl);
          },
          child: CircleAvatar(
            //头像半径
            radius: 60,
            //头像图片 -> NetworkImage网络图片，AssetImage项目资源包图片, FileImage本地存储图片
            backgroundImage: CachedNetworkImageProvider(honor.imgurl),
          ),
        ),
      ));
    }
    return _widgetList;
  }
}

Future honorDialog(context, String title, String info, String imgurl) {
  return showDialog<Null>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return GestureDetector(
        // 手势处理事件
        onTap: () {
          Navigator.of(context).pop(); //退出弹出框
        },
        child: Material(
          type: MaterialType.transparency,
          child: new Center(
            child: new SizedBox(
                width: 450.0,
                height: 600.0,
                child: Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Container(
                        height: 400,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Color(0xFFFBAA43),
                            width: 8,
                          ),
                        ),
                        child: Image.network(imgurl,
                            height: 390, width: 290, fit: BoxFit.fill)),
                    Positioned(
                      left: 200,
                      top: 350,
                      height: 120,
                      width: 200,
                      child: Container(
                        child: Card(
                          elevation: 10,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                alignment: Alignment.center,
                                child: Text(
                                  title,
                                  style: TextStyles.articleTitle,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(5),
                                alignment: Alignment.center,
                                child: Text(
                                  info,
                                  style: TextStyles.articleContent,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ),
      );
    },
  );
}
