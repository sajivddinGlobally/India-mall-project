// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
    String status;
    List<Item> items;
    String cartTotal;
    String cartSubtotal;

    CartModel({
        required this.status,
        required this.items,
        required this.cartTotal,
        required this.cartSubtotal,
    });

    factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        status: json["status"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        cartTotal: json["cart_total"],
        cartSubtotal: json["cart_subtotal"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "cart_total": cartTotal,
        "cart_subtotal": cartSubtotal,
    };
}

class Item {
    String cartItemKey;
    int productId;
    String name;
    String price;
    int quantity;
    String subtotal;
    String total;
    String image;

    Item({
        required this.cartItemKey,
        required this.productId,
        required this.name,
        required this.price,
        required this.quantity,
        required this.subtotal,
        required this.total,
        required this.image,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        cartItemKey: json["cart_item_key"],
        productId: json["product_id"],
        name: json["name"],
        price: json["price"],
        quantity: json["quantity"],
        subtotal: json["subtotal"],
        total: json["total"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "cart_item_key": cartItemKey,
        "product_id": productId,
        "name": name,
        "price": price,
        "quantity": quantity,
        "subtotal": subtotal,
        "total": total,
        "image": image,
    };
}
