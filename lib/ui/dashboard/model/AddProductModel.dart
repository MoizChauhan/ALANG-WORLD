class AddProductModel {
  String? response;
  String? message;

  AddProductModel({this.response, this.message});

  AddProductModel.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['response'] = response;
    data['message'] = message;
    return data;
  }
}
