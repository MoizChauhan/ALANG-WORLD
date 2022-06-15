class MyPlanModel {
  String? response;
  String? message;
  Results? results;

  MyPlanModel({this.response, this.message, this.results});

  MyPlanModel.fromJson(Map<String, dynamic> json) {
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
  PlanPurchase? planPurchase;
  Plan? plan;

  Results({this.planPurchase, this.plan});

  Results.fromJson(Map<String, dynamic> json) {
    planPurchase = json['plan_purchase'] != null
        ? PlanPurchase.fromJson(json['plan_purchase'])
        : null;
    plan = json['plan'] != null ? Plan.fromJson(json['plan']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (planPurchase != null) {
      data['plan_purchase'] = planPurchase!.toJson();
    }
    if (plan != null) {
      data['plan'] = plan!.toJson();
    }
    return data;
  }
}

class PlanPurchase {
  int? id;
  String? planId;
  String? sellerId;
  String? planPurchaseDate;
  String? planExpiryDate;
  String? totalUploadedProducts;
  String? totalRemainingProducts;
  String? totalCredit;
  String? remainingCredit;
  String? totalClicks;
  String? isApproved;
  String? isActive;
  String? createdBy;
  String? createdAt;
  String? updatedBy;
  String? updatedAt;

  PlanPurchase(
      {this.id,
        this.planId,
        this.sellerId,
        this.planPurchaseDate,
        this.planExpiryDate,
        this.totalUploadedProducts,
        this.totalRemainingProducts,
        this.totalCredit,
        this.remainingCredit,
        this.totalClicks,
        this.isApproved,
        this.isActive,
        this.createdBy,
        this.createdAt,
        this.updatedBy,
        this.updatedAt});

  PlanPurchase.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    planId = json['plan_id'];
    sellerId = json['seller_id'];
    planPurchaseDate = json['plan_purchase_date'];
    planExpiryDate = json['plan_expiry_date'];
    totalUploadedProducts = json['total_uploaded_products'];
    totalRemainingProducts = json['total_remaining_products'];
    totalCredit = json['total_credit'];
    remainingCredit = json['remaining_credit'];
    totalClicks = json['total_clicks'];
    isApproved = json['isApproved'];
    isActive = json['is_active'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedBy = json['updated_by'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['plan_id'] = planId;
    data['seller_id'] = sellerId;
    data['plan_purchase_date'] = planPurchaseDate;
    data['plan_expiry_date'] = planExpiryDate;
    data['total_uploaded_products'] = totalUploadedProducts;
    data['total_remaining_products'] = totalRemainingProducts;
    data['total_credit'] = totalCredit;
    data['remaining_credit'] = remainingCredit;
    data['total_clicks'] = totalClicks;
    data['isApproved'] = isApproved;
    data['is_active'] = isActive;
    data['created_by'] = createdBy;
    data['created_at'] = createdAt;
    data['updated_by'] = updatedBy;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Plan {
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

  Plan(
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
        this.updatedAt});

  Plan.fromJson(Map<String, dynamic> json) {
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
