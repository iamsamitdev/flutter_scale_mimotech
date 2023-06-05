import 'dart:convert';

List<NewsModel> newsModelFromJson(String str) =>
    List<NewsModel>.from(json.decode(str).map((x) => NewsModel.fromJson(x)));

String newsModelToJson(List<NewsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsModel {
  String? id;
  String? topic;
  String? detail;
  String? imageurl;
  String? linkurl;
  DateTime? createdAt;
  String? status;

  NewsModel({
    this.id,
    this.topic,
    this.detail,
    this.imageurl,
    this.linkurl,
    this.createdAt,
    this.status,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        id: json["id"],
        topic: json["topic"],
        detail: json["detail"],
        imageurl: json["imageurl"],
        linkurl: json["linkurl"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "topic": topic,
        "detail": detail,
        "imageurl": imageurl,
        "linkurl": linkurl,
        "created_at": createdAt?.toIso8601String(),
        "status": status,
      };
}
