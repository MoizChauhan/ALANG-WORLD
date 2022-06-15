// ignore_for_file: unnecessary_this, unnecessary_new

class GetSellerProductDataModel {
  String? response;
  String? message;
  Results? results;

  GetSellerProductDataModel({this.response, this.message, this.results});

  GetSellerProductDataModel.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    message = json['message'];
    results = json['results'] != null ? new Results.fromJson(json['results']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['response'] = this.response;
    data['message'] = this.message;
    if (this.results != null) {
      data['results'] = this.results!.toJson();
    }
    return data;
  }
}

class Results {
  List<SellerProduct>? product;
  Count? count;

  Results({this.product, this.count});

  Results.fromJson(Map<String, dynamic> json) {
    if (json['product'] != null) {
      product = <SellerProduct>[];
      json['product'].forEach((v) {
        product!.add(new SellerProduct.fromJson(v));
      });
    }
    count = json['count'] != null ? new Count.fromJson(json['count']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.product != null) {
      data['product'] = this.product!.map((v) => v.toJson()).toList();
    }
    if (this.count != null) {
      data['count'] = this.count!.toJson();
    }
    return data;
  }
}

class SellerProduct {
  int? id;
  String? sellerId;
  String? productName;
  String? catagory;
  String? description;
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
  Category? category;
  Seller? seller;

  SellerProduct(
      {this.id,
      this.sellerId,
      this.productName,
      this.catagory,
      this.description,
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
      this.seller});

  SellerProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sellerId = json['seller_id'];
    productName = json['product_name'];
    catagory = json['catagory'];
    description = json['description'];
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
    categoryname = json['categoryname'];
    sellername = json['sellername'];
    category = json['category'] != null ? new Category.fromJson(json['category']) : null;
    seller = json['seller'] != null ? new Seller.fromJson(json['seller']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['seller_id'] = this.sellerId;
    data['product_name'] = this.productName;
    data['catagory'] = this.catagory;
    data['description'] = this.description;
    data['image1'] = this.image1;
    data['image2'] = this.image2;
    data['image3'] = this.image3;
    data['image4'] = this.image4;
    data['image5'] = this.image5;
    data['image6'] = this.image6;
    data['status'] = this.status;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_by'] = this.updatedBy;
    data['updated_at'] = this.updatedAt;
    data['categoryname'] = this.categoryname;
    data['sellername'] = this.sellername;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.seller != null) {
      data['seller'] = this.seller!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? categoryName;
  String? status;
  String? createdat;

  Category({this.id, this.categoryName, this.status, this.createdat});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
    status = json['status'];
    createdat = json['createdat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['category_name'] = this.categoryName;
    data['status'] = this.status;
    data['createdat'] = this.createdat;
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
      this.isVerified});

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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['status'] = this.status;
    data['email_verified'] = this.emailVerified;
    data['contact_verified'] = this.contactVerified;
    data['is_verified'] = this.isVerified;
    return data;
  }
}

class Count {
  String? totalUploadedProducts;
  String? totalRemainingProducts;
  int? noOfAllowedProducts;

  Count({this.totalUploadedProducts, this.totalRemainingProducts, this.noOfAllowedProducts});

  Count.fromJson(Map<String, dynamic> json) {
    totalUploadedProducts = json['total_uploaded_products'];
    totalRemainingProducts = json['total_remaining_products'];
    noOfAllowedProducts = json['no_of_allowed_products'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_uploaded_products'] = this.totalUploadedProducts;
    data['total_remaining_products'] = this.totalRemainingProducts;
    data['no_of_allowed_products'] = this.noOfAllowedProducts;
    return data;
  }
}
