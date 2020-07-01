import 'package:flutter/material.dart';
import 'package:xes1v1mobileweb/common/strings.dart';
import 'package:xes1v1mobileweb/common/text_styles.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
                      Strings.about_me,
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
            Container(
              child: Card(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20, right: 20, left: 20),
                      child: Text(
                        Strings.about_1,
                        style: TextStyles.articleContent,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, right: 20, left: 20),
                      child: Text(
                        Strings.about_2,
                        style: TextStyles.articleContent,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, right: 20, left: 20),
                      child: Text(
                        Strings.about_3,
                        style: TextStyles.articleContent,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Text(
                        Strings.about_4,
                        style: TextStyles.articleContent,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Image.asset(
                        'images/team.jpg',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
