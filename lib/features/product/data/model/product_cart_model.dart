class ProductCartModel {
  List<ProductCartItem>? carts;

  ProductCartModel({this.carts});

  ProductCartModel.fromJson(Map<dynamic, dynamic> json) {
    if (json['carts'] != null) {
      carts = <ProductCartItem>[];
      json['carts'].forEach((v) {
        carts!.add(new ProductCartItem.fromJson(v));
      });
    }
  }

  Map<dynamic, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.carts != null) {
      data['carts'] = this.carts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductCartItem {
  String? slug;
  int? cartCount;

  ProductCartItem({this.slug, this.cartCount});

  ProductCartItem.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    cartCount = json['cartCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slug'] = this.slug;
    data['cartCount'] = this.cartCount;
    return data;
  }
}
