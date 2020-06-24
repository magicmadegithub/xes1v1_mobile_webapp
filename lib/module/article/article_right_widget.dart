import 'package:flutter/material.dart';

class ArticleRightWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Container(
                color: Colors.yellow,
              ),
            ),
            Flexible(
              flex: 3,
              child: Container(
                color: Colors.green,
              ),
            ),
          ],
        ));
  }
}
