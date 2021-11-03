// To parse this JSON data, do
//
//     final catalogProducts = catalogProductsFromJson(jsonString);

import 'dart:convert';

List<CatalogProducts> catalogProductsFromJson(String str) => List<CatalogProducts>.from(json.decode(str).map((x) => CatalogProducts.fromJson(x)));

String catalogProductsToJson(List<CatalogProducts> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CatalogProducts {
  CatalogProducts({
    this.createdAt,
    this.updatedAt,
    this.id,
    this.name,
    this.sku,
    this.imageUrl,
    this.category,
  });

  DateTime? createdAt;
  DateTime? updatedAt;
  int? id;
  String? name;
  String? sku;
  String? imageUrl;
  String? category;

  CatalogProducts copyWith({
    DateTime? createdAt,
    DateTime? updatedAt,
    int? id,
    String? name,
    String? sku,
    String? imageUrl,
    String? category,
  }) =>
      CatalogProducts(
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        id: id ?? this.id,
        name: name ?? this.name,
        sku: sku ?? this.sku,
        imageUrl: imageUrl ?? this.imageUrl,
        category: category ?? this.category,
      );

  factory CatalogProducts.fromJson(Map<String, dynamic> json) => CatalogProducts(
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    sku: json["sku"] == null ? null : json["sku"],
    imageUrl: json["imageURL"] == null ? null : json["imageURL"],
    category: json["category"] == null ? null : json["category"],
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "sku": sku == null ? null : sku,
    "imageURL": imageUrl == null ? null : imageUrl,
    "category": category == null ? null : category,
  };
}
