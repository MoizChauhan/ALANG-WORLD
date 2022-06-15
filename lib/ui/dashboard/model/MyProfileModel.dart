class MyProfileModel {
  String? response;
  String? message;
  Results? results;

  MyProfileModel({this.response, this.message, this.results});

  MyProfileModel.fromJson(Map<String, dynamic> json) {
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
  Profile? profile;

  Results({this.profile});

  Results.fromJson(Map<String, dynamic> json) {
    profile =
    json['profile'] != null ? Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (profile != null) {
      data['profile'] = profile!.toJson();
    }
    return data;
  }
}

class Profile {
  String? userId;
  var officeNumber;
  var profileImage;
  String? gender;
  String? address;
  String? userRole;
  String? mobile;
  String? status;
  String? createdAt;
  String? updatedAt;
  var deletedAt;
  String? company;
  var contractForm;
  var addressProof;
  var shift;
  String? tokenExpiredDate;
  int? id;
  String? district;
  String? state;
  String? country;
  String? uniqueId;
  String? pincode;
  var trial848;
  String? name;
  String? email;
  String? establishment_date;
  String? dob;

  Profile(
      {this.userId,
        this.officeNumber,
        this.profileImage,
        this.gender,
        this.address,
        this.userRole,
        this.mobile,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.company,
        this.contractForm,
        this.addressProof,
        this.shift,
        this.tokenExpiredDate,
        this.id,
        this.district,
        this.state,
        this.country,
        this.uniqueId,
        this.pincode,
        this.trial848,
        this.name,
        this.email,
        this.establishment_date,
        this.dob,});

  Profile.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    officeNumber = json['office_number'];
    profileImage = json['profile_image'];
    gender = json['gender'];
    address = json['address'];
    userRole = json['user_role'];
    mobile = json['mobile'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    company = json['company'];
    contractForm = json['contract_form'];
    addressProof = json['address_proof'];
    shift = json['shift'];
    tokenExpiredDate = json['token_expired_date'];
    id = json['id'];
    district = json['district'];
    state = json['state'];
    country = json['country'];
    uniqueId = json['unique_id'];
    pincode = json['pincode'];
    trial848 = json['trial848'];
    name = json['name'];
    email = json['email'];
    establishment_date = json['establishment_date'];
    dob = json['dob'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['office_number'] = officeNumber;
    data['profile_image'] = profileImage;
    data['gender'] = gender;
    data['address'] = address;
    data['user_role'] = userRole;
    data['mobile'] = mobile;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['company'] = company;
    data['contract_form'] = contractForm;
    data['address_proof'] = addressProof;
    data['shift'] = shift;
    data['token_expired_date'] = tokenExpiredDate;
    data['id'] = id;
    data['district'] = district;
    data['state'] = state;
    data['country'] = country;
    data['unique_id'] = uniqueId;
    data['pincode'] = pincode;
    data['trial848'] = trial848;
    data['name'] = name;
    data['email'] = email;
    data['establishment_date'] = establishment_date;
    data['dob'] = dob;
    return data;
  }
}
