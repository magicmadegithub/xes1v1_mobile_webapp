import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xes1v1mobileweb/common/text_styles.dart';
import 'package:xes1v1mobileweb/net/models/course_list_entity.dart';
import 'package:xes1v1mobileweb/net/net_url.dart';
import 'package:xes1v1mobileweb/net/net_utils.dart';

import 'course_pagination.dart';

class Course extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CourseState();
  }
}

class CourseState extends State<Course> {
  List<CourseEntity> _list = [];
  List<Widget> _images = [
    Image.asset(
      'images/it_word1.jpg',
      fit: BoxFit.fill,
    ),
    Image.asset(
      'images/it_word2.jpg',
      fit: BoxFit.fill,
    ),
    Image.asset(
      'images/it_word3.jpg',
      fit: BoxFit.fill,
    ),
    Image.asset(
      'images/it_word4.jpg',
      fit: BoxFit.fill,
    ),
    Image.asset(
      'images/it_word5.jpg',
      fit: BoxFit.fill,
    ),
  ];

  @override
  void initState() {
    super.initState();
    NetUtils.instance.get(NetUrl.courseList, onData: (data) {
      CourseListEntity result = CourseListEntity.fromJson(data);
      if (result.code == 0) {
        _list = result.data;
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
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return _images[index];
              },
              itemCount: _images.length,
              pagination: SwiperCustomPagination(
                  builder: (BuildContext context, SwiperPluginConfig config) {
                return CustomPagination(config);
              }),
              loop: true,
              autoplay: true,
              autoplayDelay: 4000,
              viewportFraction: 0.7,
              scale: 0.8,
            ),
            height: 180,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 10),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1.3,
                  ),
                  itemCount: _list.length,
                  itemBuilder: (context, index) {
                    CourseEntity course = _list[index];
                    return Card(
                      child: InkWell(
                        child: Column(
                          children: [
                            Container(
                              child: Image.network(course.imgurl),
                            ),
                            Container(
                              child: Text(
                                course.title,
                                style: TextStyles.course,
                              ),
                              margin:
                                  EdgeInsets.only(top: 10, left: 10, right: 10),
                              alignment: Alignment.center,
                            ),
                          ],
                        ),
                        splashColor: Colors.red,
                        onTap: () {
                          launch(course.link);
                        },
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
