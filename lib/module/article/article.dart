import 'package:flutter/material.dart';
import 'package:xes1v1mobileweb/module/article/article_left_widget.dart';

import 'article_right_widget.dart';

class Article extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 2,
            child: ArticleLeftWidget()
          ),
          Flexible(
            flex: 1,
            child: ArticleRightWidget()
          ),
        ],
      )
    );
  }
}
