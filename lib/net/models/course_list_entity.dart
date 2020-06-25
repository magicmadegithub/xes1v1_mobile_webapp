class CourseListEntity {
  int code;
  String msg;
  List<CourseEntity> data;

  CourseListEntity({this.code, this.msg, this.data});

  CourseListEntity.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<CourseEntity>();
      json['data'].forEach((v) {
        data.add(new CourseEntity.fromJson(v));
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

class CourseEntity {
  int id;
  String title;
  String link;
  String imgurl;
  String author;

  CourseEntity({this.id, this.title, this.link, this.imgurl, this.author});

  CourseEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    link = json['link'];
    imgurl = json['imgurl'];
    author = json['author'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['link'] = this.link;
    data['imgurl'] = this.imgurl;
    data['author'] = this.author;
    return data;
  }
}
