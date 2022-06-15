class CommonModel {
  var message;
  var response;

  CommonModel({this.message, this.response});

  CommonModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    response = json['response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['response'] = response;
    data['message'] = message;
    return data;
  }
}
