import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:xes1v1mobileweb/module/honor/honor_trophy.dart';

class Honor extends StatelessWidget {
  final sides = [60.0, 50.0, 40.0, 30.0];
  final colors = [Colors.red, Colors.yellow, Colors.blue, Colors.green];

  Widget _buildItem(double e) {
    return Container(
      width: e,
      alignment: Alignment.center,
      height: e,
      color: colors[sides.indexOf(e)],
      child: Text('$e'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: HonorTrophyWidget(
        children: sides.map((e) => _buildItem(e)).toList(),
        menu: Image.asset(
          'images/honor_trophy.png',
          width: 400,
          height: 400,
        ),
      ),
    );
  }
}
