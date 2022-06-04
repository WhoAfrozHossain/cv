class BrandModel {
  String? name;
  String? image;
  String? headerImage;
  String? slug;

  BrandModel({this.name, this.image, this.headerImage, this.slug});

  BrandModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    headerImage = json['header_image'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['header_image'] = this.headerImage;
    data['slug'] = this.slug;
    return data;
  }
}
