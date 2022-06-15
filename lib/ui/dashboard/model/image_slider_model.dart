class ImageSliderModel {
  String? response;
  String? message;
  Results? results;

  ImageSliderModel({this.response, this.message, this.results});

  ImageSliderModel.fromJson(Map<String, dynamic> json) {
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
  List<Slides>? slides;

  Results({this.slides});

  Results.fromJson(Map<String, dynamic> json) {
    if (json['slides'] != null) {
      slides = <Slides>[];
      json['slides'].forEach((v) {
        slides!.add(new Slides.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.slides != null) {
      data['slides'] = this.slides!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Slides {
  String? id;
  String? title;
  String? image;
  String? status;
  String? createdAt;
  String? updatedAt;

  Slides(
      {this.id,
      this.title,
      this.image,
      this.status,
      this.createdAt,
      this.updatedAt});

  Slides.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
