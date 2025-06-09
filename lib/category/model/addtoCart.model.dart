// To parse this JSON data, do
//
//     final addToCartBody = addToCartBodyFromJson(jsonString);

import 'dart:convert';

AddToCartBody addToCartBodyFromJson(String str) => AddToCartBody.fromJson(json.decode(str));

String addToCartBodyToJson(AddToCartBody data) => json.encode(data.toJson());

class AddToCartBody {
    int productId;
    int quantity;

    AddToCartBody({
        required this.productId,
        required this.quantity,
    });

    factory AddToCartBody.fromJson(Map<String, dynamic> json) => AddToCartBody(
        productId: json["product_id"],
        quantity: json["quantity"],
    );

    Map<String, dynamic> toJson() => {
        "product_id": productId,
        "quantity": quantity,
    };
}
AddToCartResponse addToCartResponseFromJson(String str) => AddToCartResponse.fromJson(json.decode(str));

String addToCartResponseToJson(AddToCartResponse data) => json.encode(data.toJson());

class AddToCartResponse {
    String status;
    String message;
    int productId;
    int quantity;
    String cartItemKey;

    AddToCartResponse({
        required this.status,
        required this.message,
        required this.productId,
        required this.quantity,
        required this.cartItemKey,
    });

    factory AddToCartResponse.fromJson(Map<String, dynamic> json) => AddToCartResponse(
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
