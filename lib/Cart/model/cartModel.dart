// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
    String status;
    List<Cart> cart;
    dynamic cartKey;
    int cartTotal;

    CartModel({
        required this.status,
        required this.cart,
        required this.cartKey,
        required this.cartTotal,
    });

    factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        status: json["status"],
        cart: List<Cart>.from(json["cart"].map((x) => Cart.fromJson(x))),
        cartKey: json["cart_key"],
        cartTotal: json["cart_total"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "cart": List<dynamic>.from(cart.map((x) => x.toJson())),
        "cart_key": cartKey,
        "cart_total": cartTotal,
    };
}

class Cart {
    int productId;
    String name;
    int quantity;
    String price;
    int subtotal;

    Cart({
        required this.productId,
        required this.name,
        required this.quantity,
        required this.price,
        required this.subtotal,
    });

    factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        productId: json["product_id"],
        name: json["name"],
        quantity: json["quantity"],
        price: json["price"],
        subtotal: json["subtotal"],
    );

    Map<String, dynamic> toJson() => {
        "product_id": productId,
        "name": name,
        "quantity": quantity,
        "price": price,
        "subtotal": subtotal,
    };
}
