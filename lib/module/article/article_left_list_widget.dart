import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xes1v1mobileweb/common/strings.dart';
import 'package:xes1v1mobileweb/common/text_styles.dart';
import 'package:xes1v1mobileweb/common/xes_utils.dart';
import 'package:xes1v1mobileweb/net/models/article_list_entity.dart';
import 'package:xes1v1mobileweb/net/net_url.dart';
import 'package:xes1v1mobileweb/net/net_utils.dart';

class ArticleLeftList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ArticleLeftListState();
}

class _ArticleLeftListState extends State<ArticleLeftList> {
  List<ArticleListData> _list = [];

  @override
  void initState() {
    super.initState();
    NetUtils.instance.get(NetUrl.articleList, onData: (data) {
      ArticleListEntity result = ArticleListEntity.fromJson(data);
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
      margin: EdgeInsets.only(top: 10),
      child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
          itemCount: _list.length,
          itemBuilder: (BuildContext context, int index) {
            ArticleListData data = _list[index];
            return GestureDetector(
              onTap: () {},
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.all(12),
                      child: Text(
                        data.title,
                        style: TextStyles.articleTitle,
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(Icons.date_range,
                              color: Color(0xFF757575), size: 15),
                          Text(XesUtils.parseDateTimeYMD(data.createData),
                              style: TextStyles.articleTime),
                          Text('      ', style: TextStyles.articleTime),
                          Text(data.author, style: TextStyles.articleTime),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.all(12),
                      child: Text(
                        data.content,
                        style: TextStyles.articleContent,
                        maxLines: 5,
                      ),
                    ),
                    Container(
                      height: 25,
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 12, bottom: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(Icons.border_color,
                              color: Color(0xFF757575), size: 15),
                          Text(' '),
                          Text(data.tag, style: TextStyles.articleTag),
                          Flexible(child: Container()),
                          FlatButton(
                            child: Text(
                              Strings.read_all,
                              style: TextStyles.articleReadAll,
                            ),
                            onPressed: () {
                              launch(data.link);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
