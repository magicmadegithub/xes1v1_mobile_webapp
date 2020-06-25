import 'package:flutter/material.dart';

class Frame extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FrameState();
  }
}

class FrameState extends State<Frame> {
  String text = '11111111122222233333555555666777888999';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: Colors.red,
        height: 500,
        width: 500,
        child: Text(text),
      ),
      onTap: () {

      },
    );
  }
}
