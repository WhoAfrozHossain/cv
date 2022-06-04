class ImageModel {
  int? id;
  String? image;
  bool? isPrimary;
  int? product;

  ImageModel({this.id, this.image, this.isPrimary, this.product});

  ImageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    isPrimary = json['is_primary'];
    product = json['product'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['is_primary'] = this.isPrimary;
    data['product'] = this.product;
    return data;
  }
}
