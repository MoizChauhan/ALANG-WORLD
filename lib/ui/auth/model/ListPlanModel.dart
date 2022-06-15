class ListPlanModel {
  String? response;
  String? message;
  Results? results;

  ListPlanModel({this.response, this.message, this.results});

  ListPlanModel.fromJson(Map<String, dynamic> json) {
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
  List<ListPlanResults>? plans;

  Results({this.plans});

  Results.fromJson(Map<String, dynamic> json) {
    if (json['plans'] != null) {
      plans = <ListPlanResults>[];
      json['plans'].forEach((v) {
        plans!.add(ListPlanResults.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (plans != null) {
      data['plans'] = plans!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListPlanResults {
  int? id;
  String? planName;
  String? validity;
  String? price;
  String? noOfAllowedProducts;
  String? credit;
  String? status;
  String? createdBy;
  String? createdAt;
  String? updatedBy;
  String? updatedAt;
  bool? isSelected = false;

  ListPlanResults(
      {this.id,
        this.planName,
        this.validity,
        this.price,
        this.noOfAllowedProducts,
        this.credit,
        this.status,
        this.createdBy,
        this.createdAt,
        this.updatedBy,
        this.updatedAt,
      this.isSelected});

  ListPlanResults.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    planName = json['plan_name'];
    validity = json['validity'];
    price = json['price'];
    noOfAllowedProducts = json['no_of_allowed_products'];
    credit = json['credit'];
    status = json['status'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedBy = json['updated_by'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['plan_name'] = planName;
    data['validity'] = validity;
    data['price'] = price;
    data['no_of_allowed_products'] = noOfAllowedProducts;
    data['credit'] = credit;
    data['status'] = status;
    data['created_by'] = createdBy;
    data['created_at'] = createdAt;
    data['updated_by'] = updatedBy;
    data['updated_at'] = updatedAt;
    return data;
  }
}
