class ArticleEntity {
  int code;
  String msg;
  Article data;

  ArticleEntity({this.code, this.msg, this.data});

  ArticleEntity.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? new Article.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Article {
  int id;
  String title;
  String content;
  String tag;
  int articleID;
  String author;
  String createData;

  Article(
      {this.id,
      this.title,
      this.content,
      this.tag,
      this.articleID,
      this.author,
      this.createData});

  Article.fromJson(Map<String, dynamic> json) {
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
