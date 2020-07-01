import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xes1v1mobileweb/common/strings.dart';
import 'package:xes1v1mobileweb/common/text_styles.dart';
import 'package:xes1v1mobileweb/net/models/frame_list_entity.dart';
import 'package:xes1v1mobileweb/net/net_url.dart';
import 'package:xes1v1mobileweb/net/net_utils.dart';

class FrameMobilePortrait extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FrameMobilePortraitState();
  }
}

class FrameMobilePortraitState extends State<FrameMobilePortrait> {
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
          height: 100,
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
              height: 200,
              child: Card(
                child: InkWell(
                  splashColor: Colors.red,
                  onTap: () {
                    launch(data.link);
                  },
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        height: 160,
                        width: 160,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            data.imgurl,
                            height: 100,
                            width: 100,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10, bottom: 10),
                              alignment: Alignment.topLeft,
                              child: Text(
                                data.title,
                                style: TextStyles.articleTitle,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                alignment: Alignment.topCenter,
                                child: Text(
                                  data.content,
                                  style: TextStyles.articleContent
                                      .copyWith(fontSize: 14),
                                ),
                              ),
                            )
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
