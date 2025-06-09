// To parse this JSON data, do
//
//     final addToCartResModel = addToCartResModelFromJson(jsonString);

import 'dart:convert';

AddToCartResModel addToCartResModelFromJson(String str) => AddToCartResModel.fromJson(json.decode(str));

String addToCartResModelToJson(AddToCartResModel data) => json.encode(data.toJson());

class AddToCartResModel {
    String status;
    String message;
    int productId;
    int quantity;
    String cartItemKey;

    AddToCartResModel({
        required this.status,
        required this.message,
        required this.productId,
        required this.quantity,
        required this.cartItemKey,
    });

    factory AddToCartResModel.fromJson(Map<String, dynamic> json) => AddToCartResModel(
        status: json["status"],
        message: json["message"],
        productId: json["product_id"],
        quantity: json["quantity"],
        cartItemKey: json["cart_item_key"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "product_id": productId,
        "quantity": quantity,
        "cart_item_key": cartItemKey,
    };
}
