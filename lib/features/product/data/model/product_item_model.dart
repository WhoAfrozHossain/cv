import 'package:cv/features/product/data/model/product_model.dart';

class ProductItemModel {
  String? status;
  int? statusCode;
  ProductModel? data;

  ProductItemModel({this.status, this.statusCode, this.data});

  ProductItemModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    data =
        json['data'] != null ? new ProductModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['statusCode'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
