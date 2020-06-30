import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xes1v1mobileweb/common/strings.dart';
import 'package:xes1v1mobileweb/common/text_styles.dart';

class ArticleRightWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 10),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 12),
              child: Card(
                elevation: 5,
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 50, top: 20),
                        child: Text(Strings.textCh1, style: TextStyles.text1),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 50),
                        child: Text(Strings.textCh2, style: TextStyles.text1),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 50),
                        child: Text(Strings.textUs1, style: TextStyles.text1),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 50),
                        child: Text(Strings.textUs2, style: TextStyles.text1),
                      ),
                      Text(""),
                      Container(
                        margin: EdgeInsets.only(left: 120, bottom: 20),
                        child: Text(Strings.textAuth, style: TextStyles.text2),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              alignment: Alignment.topLeft,
              child: Card(
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Tags',
                        style: TextStyles.articleContent.copyWith(fontSize: 18),
                      ),
                      margin: EdgeInsets.only(top: 12),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.all(12),
                      child: Wrap(
                        spacing: 8,
                        alignment: WrapAlignment.spaceAround,
                        children: getTags(),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              alignment: Alignment.topLeft,
              child: Card(
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        '友情链接',
                        style: TextStyles.articleContent.copyWith(fontSize: 18),
                      ),
                      margin: EdgeInsets.only(top: 12),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.all(10),
                      child: Wrap(
                        spacing: 5,
                        alignment: WrapAlignment.spaceAround,
                        children: getLinks(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  List<Widget> getTags() {
    List<Widget> tags = [];
    List<String> tagsStr = [
      "Android",
      "iOS",
      "iPad",
      "mac",
      "Java",
      "Kotlin",
      "object-c",
      "swift",
      "c++",
      "Flutter",
      "动态化",
      "跨平台",
      "混合开发"
    ];
    for (String tag in tagsStr) {
      tags.add(RawChip(
        label: Text(
          tag,
          style: TextStyles.articleContent.copyWith(color: Colors.red),
        ),
        backgroundColor: Colors.white,
        elevation: 5,
      ));
    }
    return tags;
  }

  List<Widget> getLinks() {
    List<Widget> tags = [];
    Map<String, dynamic> linkMap = {
      "学而思网校1对1": "https://www.xes1v1.com/",
      "知音楼": "http://www.zhiyinlou.com/",
      "TTC技术交流平台": "https://ttc.zhiyinlou.com/",
      "团队Wiki":
          "https://wiki.zhiyinlou.com/pages/viewpage.action?pageId=2267665",
      "Flutter中文网": "https://flutterchina.club/",
    };
    linkMap.forEach((key, value) {
      Container tagContainer = new Container(
          child: Container(
        child: ActionChip(
            avatar: CircleAvatar(
              backgroundColor: Colors.red,
              child: Text(
                key.substring(0, 1),
                style: TextStyle(color: Colors.white),
              ),
            ),
            label: Text(key),
            elevation: 5,
            backgroundColor: Colors.white,
            shadowColor: Colors.red,
            onPressed: () {
              launch(value);
            }),
      ));
      tags.add(tagContainer);
    });
    return tags;
  }
}
