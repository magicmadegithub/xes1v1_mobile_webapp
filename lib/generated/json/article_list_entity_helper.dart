import 'package:xes1v1mobileweb/net/models/article_list_entity.dart';

articleListEntityFromJson(ArticleListEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new List<ArticleListData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new ArticleListData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> articleListEntityToJson(ArticleListEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

articleListDataFromJson(ArticleListData data, Map<String, dynamic> json) {
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

Map<String, dynamic> articleListDataToJson(ArticleListData entity) {
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