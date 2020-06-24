import 'package:xes1v1mobileweb/generated/json/base/json_convert_content.dart';

class CourseListEntity with JsonConvert<CourseListEntity> {
	int code;
	String msg;
	List<CourseListData> data;
}

class CourseListData with JsonConvert<CourseListData> {
	int id;
	String title;
	String link;
	String imgurl;
	String author;
}
