import 'package:flutter/material.dart';

import 'home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '学而思网校1v1客户端主站',
      home: HomeWidget(),
    );
  }
}