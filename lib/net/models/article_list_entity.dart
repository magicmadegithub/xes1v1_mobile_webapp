import 'package:xes1v1mobileweb/generated/json/base/json_convert_content.dart';

class ArticleListEntity with JsonConvert<ArticleListEntity> {
	int code;
	String msg;
	List<ArticleListData> data;
}

class ArticleListData with JsonConvert<ArticleListData> {
	int id;
	String title;
	String content;
	String tag;
	int articleID;
	String author;
	String createData;
}
