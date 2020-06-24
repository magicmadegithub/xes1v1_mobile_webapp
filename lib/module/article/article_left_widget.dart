import 'package:flutter/material.dart';
import 'package:xes1v1mobileweb/common/strings.dart';
import 'package:xes1v1mobileweb/common/text_styles.dart';
import 'package:xes1v1mobileweb/net/models/article_list_entity.dart';
import 'package:xes1v1mobileweb/net/net_url.dart';
import 'package:xes1v1mobileweb/net/net_utils.dart';

import 'article_left_list_widget.dart';

class ArticleLeftWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        GestureDetector(
          child: Card(
            elevation: 10,
            child: Container(
              height: 120,
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 20, left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(Strings.textCh1, style: TextStyles.text1),
                  Text(Strings.textCh2, style: TextStyles.text1),
                  Text(Strings.textUs1, style: TextStyles.text1),
                  Text(Strings.textUs2, style: TextStyles.text1),
                  Text(Strings.textAuth, style: TextStyles.text2),
                ],
              ),
            ),
          ),
          onTap: () {
            print('dianji');
            NetUtils.instance.get<ArticleListEntity>(NetUrl.articleList,
                onData: (data) {
              print(data.data.length);
            });
          },
        ),
        Flexible(
          child: ArticleLeftList(),
        ),
      ],
    ));
  }
}
