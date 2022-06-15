class Unauthorised {
  String? message;
  String? status;

  Unauthorised({this.message, this.status});

  Unauthorised.fromJson(Map<String, dynamic> json) {
    if (json['message'] != null) {
      message = json['message'];
    } else if (json['detail'] != null) {
      message = json['detail'];
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['detail'] = this.message;
    data['status'] = this.status;
    return data;
  }
}
