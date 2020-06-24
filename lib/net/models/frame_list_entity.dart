import 'package:xes1v1mobileweb/generated/json/base/json_convert_content.dart';

class FrameListEntity with JsonConvert<FrameListEntity> {
	int code;
	String msg;
	List<FrameListData> data;
}

class FrameListData with JsonConvert<FrameListData> {
	int id;
	String imgurl;
	String title;
	String content;
	int frameID;
	String createData;
}
