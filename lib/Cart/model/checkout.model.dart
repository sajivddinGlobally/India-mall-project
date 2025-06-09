// To parse this JSON data, do
//
//     final checkoutModel = checkoutModelFromJson(jsonString);

import 'dart:convert';

CheckoutModel checkoutModelFromJson(String str) => CheckoutModel.fromJson(json.decode(str));

String checkoutModelToJson(CheckoutModel data) => json.encode(data.toJson());

class CheckoutModel {
    String addressId;
    String paymentMethod;
    List<CartItem> cartItems;

    CheckoutModel({
        required this.addressId,
        required this.paymentMethod,
        required this.cartItems,
    });

    factory CheckoutModel.fromJson(Map<String, dynamic> json) => CheckoutModel(
        addressId: json["address_id"],
        paymentMethod: json["payment_method"],
        cartItems: List<CartItem>.from(json["cart_items"].map((x) => CartItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "address_id": addressId,
        "payment_method": paymentMethod,
        "cart_items": List<dynamic>.from(cartItems.map((x) => x.toJson())),
    };
}

class CartItem {
    int productId;
    int quantity;

    CartItem({
        required this.productId,
        required this.quantity,
    });

    factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        productId: json["product_id"],
        quantity: json["quantity"],
    );

    Map<String, dynamic> toJson() => {
        "product_id": productId,
        "quantity": quantity,
    };
}
