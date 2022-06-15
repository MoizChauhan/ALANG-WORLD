class ProductCategoryModel {
  String? response;
  String? message;
  Results? results;

  ProductCategoryModel({this.response, this.message, this.results});

  ProductCategoryModel.fromJson(Map<String, dynamic> json) {
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
  List<Category>? category;

  Results({this.category});

  Results.fromJson(Map<String, dynamic> json) {
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (category != null) {
      data['category'] = category!.map((v) => v.toJson()).toList();
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
    data['id'] = id;
    data['category_name'] = categoryName;
    data['status'] = status;
    data['createdat'] = createdat;
    return data;
  }
}
