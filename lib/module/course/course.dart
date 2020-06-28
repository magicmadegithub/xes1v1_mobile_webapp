import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:xes1v1mobileweb/common/text_styles.dart';
import 'package:xes1v1mobileweb/net/models/course_list_entity.dart';
import 'package:xes1v1mobileweb/net/models/frame_list_entity.dart';
import 'package:xes1v1mobileweb/net/net_url.dart';
import 'package:xes1v1mobileweb/net/net_utils.dart';

import 'course_viewpage.dart';

class Course extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CourseState();
  }
}

class CourseState extends State<Course> {
  List<CourseEntity> _list;
  List<String> _images = [];

  @override
  void initState() {
    super.initState();
    NetUtils.instance.get(NetUrl.courseList, onData: (data) {
      CourseListEntity result = CourseListEntity.fromJson(data);
      if (result.code == 0) {
        _list = result.data;
        _list?.forEach((course) {
          _images.add(course.imgurl);
        });
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: new Swiper(
              itemBuilder: (BuildContext context, int index) {
                return new Image.network(
                  _images[index],
                  fit: BoxFit.fill,
                );
              },
              itemCount: _images.length,
              pagination: new SwiperPagination(),
              control: new SwiperControl(),
            ),
            height: 200,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.15,
                ),
                itemBuilder: (context, index) {
                  CourseEntity course = _list[index];
                  return Container(
                    child: Card(
                      child: Column(
                        children: [
                          Container(
                            child: ClipRRect(
                                child: Image.network(course.imgurl),
                                borderRadius: BorderRadius.circular(10)),
                            margin: EdgeInsets.all(10),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Text(
                              course.title,
                              style: TextStyles.course,
                            ),
                            alignment: Alignment.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: _list.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
