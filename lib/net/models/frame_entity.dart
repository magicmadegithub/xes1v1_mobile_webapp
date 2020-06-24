import 'package:xes1v1mobileweb/generated/json/base/json_convert_content.dart';

class FrameEntity with JsonConvert<FrameEntity> {
	int code;
	String msg;
	FrameData data;
}

class FrameData with JsonConvert<FrameData> {
	int id;
	String imgurl;
	String title;
	String content;
	int frameID;
	String createData;
}
