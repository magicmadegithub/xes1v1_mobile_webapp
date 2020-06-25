class ArticleListEntity {
  int code;
  String msg;
  List<ArticleListData> data;

  ArticleListEntity({this.code, this.msg, this.data});

  ArticleListEntity.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<ArticleListData>();
      json['data'].forEach((v) {
        data.add(new ArticleListData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ArticleListData {
  int id;
  String title;
  String content;
  String tag;
  int articleID;
  String author;
  String createData;

  ArticleListData(
      {this.id,
      this.title,
      this.content,
      this.tag,
      this.articleID,
      this.author,
      this.createData});

  ArticleListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    tag = json['tag'];
    articleID = json['articleID'];
    author = json['author'];
    createData = json['createData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['tag'] = this.tag;
    data['articleID'] = this.articleID;
    data['author'] = this.author;
    data['createData'] = this.createData;
    return data;
  }
}
