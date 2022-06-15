import 'package:sb_portal/ui/dashboard/model/ProductCategoryModel.dart';

class ProductListModel {
  String? response;
  String? message;
  Results? results;

  ProductListModel({this.response, this.message, this.results});

  ProductListModel.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    message = json['message'];
    results =
    json['results'] != null ? Results.fromJson(json['results']) : null;
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
  Count? count;

  Results({this.product, this.count});

  Results.fromJson(Map<String, dynamic> json) {
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product!.add(Product.fromJson(v));
      });
    }
    count = json['count'] != null ? Count.fromJson(json['count']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (product != null) {
      data['product'] = product!.map((v) => v.toJson()).toList();
    }
    if (count != null) {
      data['count'] = count!.toJson();
    }
    return data;
  }
}

class Product {
  int? id;
  String? sellerId;
  String? productName;
  String? catagory;
  String? image1;
  String? image2;
  String? image3;
  String? image4;
  String? image5;
  String? image6;
  String? status;
  String? createdBy;
  String? createdAt;
  String? updatedBy;
  String? updatedAt;
  String? categoryname;
  String? sellername;
  String? description;
  Category? category;
  Seller? seller;

  Product(
      {this.id,
        this.sellerId,
        this.productName,
        this.catagory,
        this.image1,
        this.image2,
        this.image3,
        this.image4,
        this.image5,
        this.image6,
        this.status,
        this.createdBy,
        this.createdAt,
        this.updatedBy,
        this.updatedAt,
        this.categoryname,
        this.sellername,
        this.category,
        this.seller,
      this.description});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sellerId = json['seller_id'];
    productName = json['product_name'];
    catagory = json['catagory'];
    image1 = json['image1'];
    image2 = json['image2'];
    image3 = json['image3'];
    image4 = json['image4'];
    image5 = json['image5'];
    image6 = json['image6'];
    status = json['status'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedBy = json['updated_by'];
    updatedAt = json['updated_at'];
    description = json['description'];
    categoryname = json['categoryname'];
    sellername = json['sellername'];
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
    seller =
    json['seller'] != null ? Seller.fromJson(json['seller']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['seller_id'] = sellerId;
    data['product_name'] = productName;
    data['catagory'] = catagory;
    data['image1'] = image1;
    data['image2'] = image2;
    data['image3'] = image3;
    data['image4'] = image4;
    data['image5'] = image5;
    data['image6'] = image6;
    data['status'] = status;
    data['created_by'] = createdBy;
    data['created_at'] = createdAt;
    data['updated_by'] = updatedBy;
    data['updated_at'] = updatedAt;
    data['categoryname'] = categoryname;
    data['sellername'] = sellername;
    data['description'] = description;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (seller != null) {
      data['seller'] = seller!.toJson();
    }
    return data;
  }
}


class Seller {
  int? id;
  String? name;
  String? email;
  var emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? status;
  String? emailVerified;
  String? contactVerified;
  String? isVerified;
  var trial852;

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

class Count {
  String? totalUploadedProducts;
  String? totalRemainingProducts;
  int? noOfAllowedProducts;

  Count(
      {this.totalUploadedProducts,
        this.totalRemainingProducts,
        this.noOfAllowedProducts});

  Count.fromJson(Map<String, dynamic> json) {
    totalUploadedProducts = json['total_uploaded_products'];
    totalRemainingProducts = json['total_remaining_products'];
    noOfAllowedProducts = json['no_of_allowed_products'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_uploaded_products'] = totalUploadedProducts;
    data['total_remaining_products'] = totalRemainingProducts;
    data['no_of_allowed_products'] = noOfAllowedProducts;
    return data;
  }
}
