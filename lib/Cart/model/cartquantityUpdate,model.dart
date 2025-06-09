// To parse this JSON data, do
//
//     final updateQuantityBody = updateQuantityBodyFromJson(jsonString);

import 'dart:convert';

UpdateQuantityBody updateQuantityBodyFromJson(String str) => UpdateQuantityBody.fromJson(json.decode(str));

String updateQuantityBodyToJson(UpdateQuantityBody data) => json.encode(data.toJson());

class UpdateQuantityBody {
    int productId;
    int quantity;

    UpdateQuantityBody({
        required this.productId,
        required this.quantity,
    });

    factory UpdateQuantityBody.fromJson(Map<String, dynamic> json) => UpdateQuantityBody(
        productId: json["product_id"],
        quantity: json["quantity"],
    );

    Map<String, dynamic> toJson() => {
        "product_id": productId,
        "quantity": quantity,
    };
}


UpdateQuantityResponse updateQuantityResponseFromJson(String str) => UpdateQuantityResponse.fromJson(json.decode(str));

String updateQuantityResponseToJson(UpdateQuantityResponse data) => json.encode(data.toJson());

class UpdateQuantityResponse {
    String status;
    String message;
    int productId;
    int quantity;
    dynamic cartKey;

    UpdateQuantityResponse({
        required this.status,
        required this.message,
        required this.productId,
        required this.quantity,
        required this.cartKey,
    });

    factory UpdateQuantityResponse.fromJson(Map<String, dynamic> json) => UpdateQuantityResponse(
        status: json["status"],
        message: json["message"],
        productId: json["product_id"],
        quantity: json["quantity"],
        cartKey: json["cart_key"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "product_id": productId,
        "quantity": quantity,
        "cart_key": cartKey,
    };
}