class FrameEntity {
  int code;
  String msg;
  Frame data;

  FrameEntity({this.code, this.msg, this.data});

  FrameEntity.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? new Frame.fromJson(json['data']) : null;
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

class Frame {
  int id;
  String imgurl;
  String title;
  String content;
  int frameID;
  String createData;

  Frame(
      {this.id,
        this.imgurl,
        this.title,
        this.content,
        this.frameID,
        this.createData});

  Frame.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imgurl = json['imgurl'];
    title = json['title'];
    content = json['content'];
    frameID = json['frameID'];
    createData = json['createData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['imgurl'] = this.imgurl;
    data['title'] = this.title;
    data['content'] = this.content;
    data['frameID'] = this.frameID;
    data['createData'] = this.createData;
    return data;
  }
}