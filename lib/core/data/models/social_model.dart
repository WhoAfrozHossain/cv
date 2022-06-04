class SocialModel {
  int? id;
  String? title;
  String? icon;
  String? link;
  String? createdAt;
  String? updatedAt;

  SocialModel(
      {this.id,
      this.title,
      this.icon,
      this.link,
      this.createdAt,
      this.updatedAt});

  SocialModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    icon = json['icon'];
    link = json['link'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['icon'] = icon;
    data['link'] = link;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}