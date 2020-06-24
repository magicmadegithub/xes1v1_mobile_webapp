import 'package:xes1v1mobileweb/net/models/article_entity.dart';

articleEntityFromJson(ArticleEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new ArticleData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> articleEntityToJson(ArticleEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

articleDataFromJson(ArticleData data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['content'] != null) {
		data.content = json['content']?.toString();
	}
	if (json['tag'] != null) {
		data.tag = json['tag']?.toString();
	}
	if (json['articleID'] != null) {
		data.articleID = json['articleID']?.toInt();
	}
	if (json['author'] != null) {
		data.author = json['author']?.toString();
	}
	if (json['createData'] != null) {
		data.createData = json['createData']?.toString();
	}
	return data;
}

Map<String, dynamic> articleDataToJson(ArticleData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['title'] = entity.title;
	data['content'] = entity.content;
	data['tag'] = entity.tag;
	data['articleID'] = entity.articleID;
	data['author'] = entity.author;
	data['createData'] = entity.createData;
	return data;
}