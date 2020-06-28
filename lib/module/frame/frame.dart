import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xes1v1mobileweb/common/strings.dart';
import 'package:xes1v1mobileweb/common/text_styles.dart';
import 'package:xes1v1mobileweb/net/models/frame_list_entity.dart';
import 'package:xes1v1mobileweb/net/net_url.dart';
import 'package:xes1v1mobileweb/net/net_utils.dart';

class Frame extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FrameState();
  }
}

class FrameState extends State<Frame> {
  List<FrameEntity> _list = [];

  @override
  void initState() {
    super.initState();
    NetUtils.instance.get(NetUrl.frameList, onData: (data) {
      FrameListEntity result = FrameListEntity.fromJson(data);
      if (result.code == 0) {
        setState(() {
          _list = result.data;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 150,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(),
              ),
              Expanded(
                child: Container(
                  height: 3.0,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      Colors.white,
                      Colors.red,
                    ]),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  Strings.team_frame,
                  style: TextStyles.teamFrame,
                ),
              ),
              Expanded(
                child: Container(
                  height: 3.0,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      Colors.red,
                      Colors.white,
                    ]),
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
            ],
          ),
        ),
        Expanded(
            child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
          itemBuilder: (BuildContext context, int index) {
            FrameEntity data = _list[index];
            return Container(
              height: 165,
              child: Card(
                child: InkWell(
                  splashColor: Colors.red,
                  onTap: () {
                    launch(data.link);
                  },
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(data.imgurl),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 15, left: 20),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                data.title,
                                style: TextStyles.articleTitle,
                              ),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(top: 10, left: 20, right: 20),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                data.content,
                                style: TextStyles.articleContent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: _list.length,
        )),
      ],
    ));
  }

  Widget getLine() {
    return new Container(
      height: 10.0,
      decoration: new BoxDecoration(
        gradient: const LinearGradient(colors: [
          Colors.white,
          Colors.red,
        ]),
      ),
    );
  }
}
