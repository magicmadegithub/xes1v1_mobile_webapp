import 'package:flutter/material.dart';
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
    NetUtils.instance.get<ArticleListEntity>(NetUrl.articleList,
        onData: (data) {
      if (data.code == 0) {
        setState(() {
          _list = data.data;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: ListView.builder(
          itemCount: _list.length,
          itemBuilder: (BuildContext context, int index) {
            ArticleListData data = _list[index];
            return Card(
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
                        Icon(Icons.date_range, color: Colors.grey),
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
//                  ButtonBar(
//                    children: <Widget>[
//                      FlatButton(
//                        child: Text(Strings.read_all,
//                            style: TextStyles.articleContent
//                                .copyWith(color: Colors.red)),
//                        onPressed: () {},
//                      ),
//                    ],
//                  ),
                ],
              ),
            );
          }),
    );
  }
}

class ArticleItem extends StatefulWidget {
  ArticleListData _data;

  ArticleItem(ArticleListData data) {
    _data = data;
  }

  @override
  State<StatefulWidget> createState() => _ArticleItemState(_data);
}

class _ArticleItemState extends State<ArticleItem> {
  ArticleListData _data;

  _ArticleItemState(ArticleListData data) {
    _data = data;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
