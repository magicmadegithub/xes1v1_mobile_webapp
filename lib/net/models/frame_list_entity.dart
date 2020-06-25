class FrameListEntity {
  int code;
  String msg;
  List<FrameEntity> data;

  FrameListEntity({this.code, this.msg, this.data});

  FrameListEntity.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<FrameEntity>();
      json['data'].forEach((v) {
        data.add(new FrameEntity.fromJson(v));
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

class FrameEntity {
  int id;
  String imgurl;
  String title;
  String content;
  int frameID;
  String createData;

  FrameEntity(
      {this.id,
        this.imgurl,
        this.title,
        this.content,
        this.frameID,
        this.createData});

  FrameEntity.fromJson(Map<String, dynamic> json) {
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
