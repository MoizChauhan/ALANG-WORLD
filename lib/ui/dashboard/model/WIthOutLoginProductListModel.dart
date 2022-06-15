import 'package:sb_portal/ui/dashboard/model/ProductListModel.dart';

class WIthOutLoginProductListModel {
  String? response;
  String? message;
  Results? results;

  WIthOutLoginProductListModel({this.response, this.message, this.results});

  WIthOutLoginProductListModel.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    message = json['message'];
    results = json['results'] != null ? Results.fromJson(json['results']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['response'] = response;
    data['message'] = message;
    if (results != null) {
      data['results'] = results!.toJson();
    }
    return data;
  }
}

class Results {
  List<Product>? product;
  int? count;

  Results({this.product, this.count});

  Results.fromJson(Map<String, dynamic> json) {
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product!.add(Product.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (product != null) {
      data['product'] = product!.map((v) => v.toJson()).toList();
    }
    data['count'] = count;
    return data;
  }
}

class Seller {
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? status;
  String? emailVerified;
  String? contactVerified;
  String? isVerified;
  String? trial852;

  Seller(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt,
      this.status,
      this.emailVerified,
      this.contactVerified,
      this.isVerified,
      this.trial852});

  Seller.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    emailVerified = json['email_verified'];
    contactVerified = json['contact_verified'];
    isVerified = json['is_verified'];
    trial852 = json['trial852'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['status'] = status;
    data['email_verified'] = emailVerified;
    data['contact_verified'] = contactVerified;
    data['is_verified'] = isVerified;
    data['trial852'] = trial852;
    return data;
  }
}
