import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xes1v1mobileweb/common/strings.dart';
import 'package:xes1v1mobileweb/common/text_styles.dart';

class ArticleRightWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  margin: EdgeInsets.all(18),
                  child: Wrap(
                    spacing: 5,
                    alignment: WrapAlignment.spaceAround,
                    children: getLink(),
                  ),
                )
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
      Container tagContainer = new Container(
        margin: EdgeInsets.all(3),
        child: Container(
          child: Text(
            tag,
            style: TextStyles.articleContent,
          ),
          margin: EdgeInsets.all(2),
        ),
        padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.red,
            width: 1,
          ),
        ),
      );
      tags.add(tagContainer);
    }
    return tags;
  }

  List<Widget> getLink() {
    List<Widget> tags = [];
    Map<String, dynamic> linkMap = {
      "知音楼": "http://www.zhiyinlou.com",
      "TTC技术交流平台": "https://ttc.zhiyinlou.com",
      "Flutter中文网": "https://flutterchina.club/",
    };
    linkMap.forEach((key, value) {
      Container tagContainer = new Container(
        child: Container(
            child: OutlineButton(
                child: Text(key, style: TextStyles.linkText),
                borderSide: new BorderSide(color: Colors.red, width: 2),
                color: Colors.blue,
                onPressed: () {
                  launch(value);
                })),
      );
      tags.add(tagContainer);
    });
    return tags;
  }
}
