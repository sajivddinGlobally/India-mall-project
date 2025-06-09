// To parse this JSON data, do
//
//     final categorModel = categorModelFromJson(jsonString);

import 'dart:convert';

List<CategorModel> categorModelFromJson(String str) => List<CategorModel>.from(json.decode(str).map((x) => CategorModel.fromJson(x)));

String categorModelToJson(List<CategorModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategorModel {
    int id;
    String name;
    String slug;
    String description;
    int count;
    String? imageUrl;
    int parent;

    CategorModel({
        required this.id,
        required this.name,
        required this.slug,
        required this.description,
        required this.count,
        required this.imageUrl,
        required this.parent,
    });

    factory CategorModel.fromJson(Map<String, dynamic> json) => CategorModel(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        count: json["count"],
        imageUrl: json["image_url"],
        parent: json["parent"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "description": description,
        "count": count,
        "image_url": imageUrl,
        "parent": parent,
    };
}
