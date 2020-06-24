import 'package:xes1v1mobileweb/net/models/honor_list_entity.dart';

honorListEntityFromJson(HonorListEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new List<HonorListData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new HonorListData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> honorListEntityToJson(HonorListEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

honorListDataFromJson(HonorListData data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['info'] != null) {
		data.info = json['info']?.toString();
	}
	if (json['imgurl'] != null) {
		data.imgurl = json['imgurl']?.toString();
	}
	return data;
}

Map<String, dynamic> honorListDataToJson(HonorListData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['title'] = entity.title;
	data['info'] = entity.info;
	data['imgurl'] = entity.imgurl;
	return data;
}