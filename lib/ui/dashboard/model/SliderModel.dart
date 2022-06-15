class SliderModel {
  String? response;
  String? message;
  Results? results;

  SliderModel({this.response, this.message, this.results});

  SliderModel.fromJson(Map<String, dynamic> json) {
    response = json['response'];
    message = json['message'];
    results =
    json['results'] != null ? new Results.fromJson(json['results']) : null;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    if (slides != null) {
      data['slides'] = slides!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
