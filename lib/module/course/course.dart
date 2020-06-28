import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:xes1v1mobileweb/common/text_styles.dart';
import 'package:xes1v1mobileweb/net/models/course_list_entity.dart';
import 'package:xes1v1mobileweb/net/net_url.dart';
import 'package:xes1v1mobileweb/net/net_utils.dart';

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
        setState(() {
          
        });
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
              pagination: SwiperPagination(),
              loop: true,
              autoplay: true,
              autoplayDelay: 4000,
              viewportFraction: 0.7,
              scale: 0.8,
            ),
            height: 200,
          ),
          Expanded(
            child: Container(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: _list.length,
                  itemBuilder: (context, index) {
                    CourseEntity course = _list[index];
                    return Container(color: Colors.red,);
                  }),
            ),
//            child: Container(
//              margin: EdgeInsets.only(top: 20),
//              child: GridView.builder(
//                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                  crossAxisCount: 3,
//                  mainAxisSpacing: 5,
//                  crossAxisSpacing: 10,
//
//                ),
//                itemBuilder: (context, index) {
//                  CourseEntity course = _list[index];
//                  return Container(
//                    child: Card(
//                      child: Column(
//                        children: [
//                          Container(
//                            child: ClipRRect(
//                                child: Image.network(course.imgurl),
//                                borderRadius: BorderRadius.circular(10)),
//                            margin: EdgeInsets.all(10),
//                          ),
//                          Container(
//                            margin: EdgeInsets.all(10),
//                            child: Text(
//                              course.title,
//                              style: TextStyles.course,
//                            ),
//                            alignment: Alignment.center,
//                          ),
//                        ],
//                      ),
//                    ),
//                  );
//                },
//                itemCount: _list.length,
//              ),
//            ),
          ),
        ],
      ),
    );
  }
}
