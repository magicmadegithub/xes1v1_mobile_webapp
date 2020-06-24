import 'package:xes1v1mobileweb/net/models/frame_list_entity.dart';

frameListEntityFromJson(FrameListEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new List<FrameListData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new FrameListData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> frameListEntityToJson(FrameListEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

frameListDataFromJson(FrameListData data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['imgurl'] != null) {
		data.imgurl = json['imgurl']?.toString();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['content'] != null) {
		data.content = json['content']?.toString();
	}
	if (json['frameID'] != null) {
		data.frameID = json['frameID']?.toInt();
	}
	if (json['createData'] != null) {
		data.createData = json['createData']?.toString();
	}
	return data;
}

Map<String, dynamic> frameListDataToJson(FrameListData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['imgurl'] = entity.imgurl;
	data['title'] = entity.title;
	data['content'] = entity.content;
	data['frameID'] = entity.frameID;
	data['createData'] = entity.createData;
	return data;
}