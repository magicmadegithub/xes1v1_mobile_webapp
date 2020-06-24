import 'package:xes1v1mobileweb/net/models/course_list_entity.dart';

courseListEntityFromJson(CourseListEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new List<CourseListData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new CourseListData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> courseListEntityToJson(CourseListEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

courseListDataFromJson(CourseListData data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['link'] != null) {
		data.link = json['link']?.toString();
	}
	if (json['imgurl'] != null) {
		data.imgurl = json['imgurl']?.toString();
	}
	if (json['author'] != null) {
		data.author = json['author']?.toString();
	}
	return data;
}

Map<String, dynamic> courseListDataToJson(CourseListData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['title'] = entity.title;
	data['link'] = entity.link;
	data['imgurl'] = entity.imgurl;
	data['author'] = entity.author;
	return data;
}