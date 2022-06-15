class GetSellerDataModel {
  String? response;
  String? message;
  Results? results;

  GetSellerDataModel({this.response, this.message, this.results});

  GetSellerDataModel.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    message = json['message'];
    results =
        json['results'] != null ? new Results.fromJson(json['results']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response'] = this.response;
    data['message'] = this.message;
    if (this.results != null) {
      data['results'] = this.results!.toJson();
    }
    return data;
  }
}

class Results {
  List<Seller>? seller;

  Results({this.seller});

  Results.fromJson(Map<String, dynamic> json) {
    if (json['seller'] != null) {
      seller = <Seller>[];
      json['seller'].forEach((v) {
        seller!.add(new Seller.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.seller != null) {
      data['seller'] = this.seller!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Seller {
  int? id;
  String? name;
  String? email;
  SellerDetails? sellerDetails;

  Seller({this.id, this.name, this.email, this.sellerDetails});

  Seller.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    sellerDetails = json['seller_details'] != null
        ? new SellerDetails.fromJson(json['seller_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    if (this.sellerDetails != null) {
      data['seller_details'] = this.sellerDetails!.toJson();
    }
    return data;
  }
}

class SellerDetails {
  String? userId;
  String? mobile;
  String? establishmentDate;
  String? gender;
  String? company;
  String? state;
  String? district;
  String? country;
  String? pincode;

  SellerDetails(
      {this.userId,
      this.mobile,
      this.establishmentDate,
      this.gender,
      this.company,
      this.state,
      this.district,
      this.country,
      this.pincode});

  SellerDetails.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    mobile = json['mobile'];
    establishmentDate = json['establishment_date'];
    gender = json['gender'];
    company = json['company'];
    state = json['state'];
    district = json['district'];
    country = json['country'];
    pincode = json['pincode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['mobile'] = this.mobile;
    data['establishment_date'] = this.establishmentDate;
    data['gender'] = this.gender;
    data['company'] = this.company;
    data['state'] = this.state;
    data['district'] = this.district;
    data['country'] = this.country;
    data['pincode'] = this.pincode;
    return data;
  }
}