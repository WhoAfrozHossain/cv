class PlatformModel {
  int? id;
  String? title;
  String? value;
  String? createdAt;
  String? updatedAt;

  PlatformModel({this.id, this.title, this.value, this.createdAt, this.updatedAt});

  PlatformModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    value = json['value'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['value'] = value;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}