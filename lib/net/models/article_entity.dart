import 'package:xes1v1mobileweb/generated/json/base/json_convert_content.dart';

class ArticleEntity with JsonConvert<ArticleEntity> {
	int code;
	String msg;
	ArticleData data;
}

class ArticleData with JsonConvert<ArticleData> {
	int id;
	String title;
	String content;
	String tag;
	int articleID;
	String author;
	String createData;
}
