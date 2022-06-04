import 'package:cv/features/product/data/model/brand_model.dart';
import 'package:cv/features/product/data/model/charge_model.dart';
import 'package:cv/features/product/data/model/image_model.dart';

class ProductModel {
  int? id;
  BrandModel? brand;
  String? image;
  ChargeModel? charge;
  List<ImageModel>? images;
  String? slug;
  String? productName;
  String? model;
  String? commissionType;
  String? amount;
  String? tag;
  String? description;
  String? note;
  String? embaddedVideoLink;
  int? maximumOrder;
  int? stock;
  bool? isBackOrder;
  String? specification;
  String? warranty;
  bool? preOrder;
  int? productReview;
  bool? isSeller;
  bool? isPhone;
  bool? willShowEmi;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  String? seller;
  String? createdBy;
  List<int>? category;

  ProductModel(
      {this.id,
      this.brand,
      this.image,
      this.charge,
      this.images,
      this.slug,
      this.productName,
      this.model,
      this.commissionType,
      this.amount,
      this.tag,
      this.description,
      this.note,
      this.embaddedVideoLink,
      this.maximumOrder,
      this.stock,
      this.isBackOrder,
      this.specification,
      this.warranty,
      this.preOrder,
      this.productReview,
      this.isSeller,
      this.isPhone,
      this.willShowEmi,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.seller,
      this.createdBy,
      this.category});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brand =
        json['brand'] != null ? new BrandModel.fromJson(json['brand']) : null;
    image = json['image'];
    charge = json['charge'] != null
        ? new ChargeModel.fromJson(json['charge'])
        : null;
    if (json['images'] != null) {
      images = <ImageModel>[];
      json['images'].forEach((v) {
        images!.add(new ImageModel.fromJson(v));
      });
    }
    slug = json['slug'];
    productName = json['product_name'];
    model = json['model'];
    commissionType = json['commission_type'];
    amount = json['amount'];
    tag = json['tag'];
    description = json['description'];
    note = json['note'];
    embaddedVideoLink = json['embadded_video_link'];
    maximumOrder = json['maximum_order'];
    stock = json['stock'];
    isBackOrder = json['is_back_order'];
    specification = json['specification'];
    warranty = json['warranty'];
    preOrder = json['pre_order'];
    productReview = json['product_review'];
    isSeller = json['is_seller'];
    isPhone = json['is_phone'];
    willShowEmi = json['will_show_emi'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    seller = json['seller'];
    createdBy = json['created_by'];
    category = json['category'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    data['image'] = this.image;
    if (this.charge != null) {
      data['charge'] = this.charge!.toJson();
    }
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['slug'] = this.slug;
    data['product_name'] = this.productName;
    data['model'] = this.model;
    data['commission_type'] = this.commissionType;
    data['amount'] = this.amount;
    data['tag'] = this.tag;
    data['description'] = this.description;
    data['note'] = this.note;
    data['embadded_video_link'] = this.embaddedVideoLink;
    data['maximum_order'] = this.maximumOrder;
    data['stock'] = this.stock;
    data['is_back_order'] = this.isBackOrder;
    data['specification'] = this.specification;
    data['warranty'] = this.warranty;
    data['pre_order'] = this.preOrder;
    data['product_review'] = this.productReview;
    data['is_seller'] = this.isSeller;
    data['is_phone'] = this.isPhone;
    data['will_show_emi'] = this.willShowEmi;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['seller'] = this.seller;
    data['created_by'] = this.createdBy;
    data['category'] = this.category;

    return data;
  }
}
