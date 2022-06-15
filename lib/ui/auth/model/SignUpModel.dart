class SignUpModel {
  String? response;
  String? message;
  Results? results;

  SignUpModel({this.response, this.message, this.results});

  SignUpModel.fromJson(Map<String, dynamic> json) {
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
  String? token;
  User? user;
  bool? isHavePlan;

  Results({this.token, this.user});

  Results.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    isHavePlan = json['is_have_plan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['is_have_plan'] = isHavePlan;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? status;
  String? emailVerified;
  String? contactVerified;
  String? trial852;
  List<AuthAccessToken>? authAccessToken;
  UserDetails? userDetails;

  User(
      {this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
        this.status,
        this.emailVerified,
        this.contactVerified,
        this.trial852,
        this.authAccessToken,
        this.userDetails});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    emailVerified = json['email_verified'];
    contactVerified = json['contact_verified'].toString();
    trial852 = json['trial852'];
    if (json['auth_access_token'] != null) {
      authAccessToken = <AuthAccessToken>[];
      json['auth_access_token'].forEach((v) {
        authAccessToken!.add(AuthAccessToken.fromJson(v));
      });
    }
    userDetails = json['user_details'] != null
        ? UserDetails.fromJson(json['user_details'])
        : null;
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
    data['trial852'] = trial852;
    if (authAccessToken != null) {
      data['auth_access_token'] =
          authAccessToken!.map((v) => v.toJson()).toList();
    }
    if (userDetails != null) {
      data['user_details'] = userDetails!.toJson();
    }
    return data;
  }
}

class AuthAccessToken {
  int? id;
  String? userId;
  String? clientId;
  String? name;
  String? scopes;
  String? revoked;
  String? createdAt;
  String? updatedAt;
  String? expiresAt;
  String? trial822;

  AuthAccessToken(
      {this.id,
        this.userId,
        this.clientId,
        this.name,
        this.scopes,
        this.revoked,
        this.createdAt,
        this.updatedAt,
        this.expiresAt,
        this.trial822});

  AuthAccessToken.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    clientId = json['client_id'];
    name = json['name'];
    scopes = json['scopes'];
    revoked = json['revoked'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    expiresAt = json['expires_at'];
    trial822 = json['trial822'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['client_id'] = clientId;
    data['name'] = name;
    data['scopes'] = scopes;
    data['revoked'] = revoked;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['expires_at'] = expiresAt;
    data['trial822'] = trial822;
    return data;
  }
}

class UserDetails {
  String? userId;
  String? officeNumber;
  String? profileImage;
  String? gender;
  String? address;
  String? userRole;
  String? mobile;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? company;
  String? contractForm;
  String? addressProof;
  String? shift;
  String? token;
  String? tokenExpiredDate;
  int? id;
  String? district;
  String? state;
  String? country;
  String? uniqueId;
  String? pincode;
  String? trial848;

  UserDetails(
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
        this.token,
        this.tokenExpiredDate,
        this.id,
        this.district,
        this.state,
        this.country,
        this.uniqueId,
        this.pincode,
        this.trial848});

  UserDetails.fromJson(Map<String, dynamic> json) {
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
    token = json['token'];
    tokenExpiredDate = json['token_expired_date'];
    id = json['id'];
    district = json['district'];
    state = json['state'];
    country = json['country'];
    uniqueId = json['unique_id'];
    pincode = json['pincode'];
    trial848 = json['trial848'];
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
    data['token'] = token;
    data['token_expired_date'] = tokenExpiredDate;
    data['id'] = id;
    data['district'] = district;
    data['state'] = state;
    data['country'] = country;
    data['unique_id'] = uniqueId;
    data['pincode'] = pincode;
    data['trial848'] = trial848;
    return data;
  }
}
