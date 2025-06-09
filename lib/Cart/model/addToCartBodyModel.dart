// To parse this JSON data, do
//
//     final addToCartBodyModel = addToCartBodyModelFromJson(jsonString);

import 'dart:convert';

AddToCartBodyModel addToCartBodyModelFromJson(String str) => AddToCartBodyModel.fromJson(json.decode(str));

String addToCartBodyModelToJson(AddToCartBodyModel data) => json.encode(data.toJson());

class AddToCartBodyModel {
    int productId;
    int quantity;

    AddToCartBodyModel({
        required this.productId,
        required this.quantity,
    });

    factory AddToCartBodyModel.fromJson(Map<String, dynamic> json) => AddToCartBodyModel(
        productId: json["product_id"],
        quantity: json["Quantity"],
    );

    Map<String, dynamic> toJson() => {
        "product_id": productId,
        "Quantity": quantity,
    };
}
