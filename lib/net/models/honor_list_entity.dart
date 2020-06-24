import 'package:xes1v1mobileweb/generated/json/base/json_convert_content.dart';

class HonorListEntity with JsonConvert<HonorListEntity> {
	int code;
	String msg;
	List<HonorListData> data;
}

class HonorListData with JsonConvert<HonorListData> {
	int id;
	String title;
	String info;
	String imgurl;
}
