class InfoModel {
  int? id;
  String? name;
  String? post;
  String? email;
  String? carrierWords;
  String? aboutMe;
  String? location;
  String? phone;
  String? skill;
  String? photo;
  String? createdAt;
  String? updatedAt;

  InfoModel(
      {this.id,
      this.name,
      this.post,
      this.email,
      this.carrierWords,
      this.aboutMe,
      this.location,
      this.phone,
      this.skill,
      this.photo,
      this.createdAt,
      this.updatedAt});

  InfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    post = json['post'];
    email = json['email'];
    carrierWords = json['carrier_words'];
    aboutMe = json['about_me'];
    location = json['location'];
    phone = json['phone'];
    skill = json['skill'];
    photo = json['photo'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['post'] = post;
    data['email'] = email;
    data['carrier_words'] = carrierWords;
    data['about_me'] = aboutMe;
    data['location'] = location;
    data['phone'] = phone;
    data['skill'] = skill;
    data['photo'] = photo;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}