class HonorListEntity {
  int code;
  String msg;
  List<HonorEntity> data;

  HonorListEntity({this.code, this.msg, this.data});

  HonorListEntity.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<HonorEntity>();
      json['data'].forEach((v) {
        data.add(new HonorEntity.fromJson(v));
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

class HonorEntity {
  int id;
  String title;
  String info;
  String imgurl;

  HonorEntity({this.id, this.title, this.info, this.imgurl});

  HonorEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    info = json['info'];
    imgurl = json['imgurl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['info'] = this.info;
    data['imgurl'] = this.imgurl;
    return data;
  }
}
