import 'package:flutter/material.dart';
import 'package:xes1v1mobileweb/module/article/article_left_widget.dart';
import 'package:xes1v1mobileweb/common/strings.dart';

import 'article_right_widget.dart';

class ArticleMobilePortrait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Container(
        child: Column(
          children: <Widget>[
            Flexible(child: ArticleLeftWidget()),
          ],
        ),
      );
  }
}
