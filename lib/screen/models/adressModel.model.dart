// To parse this JSON data, do
//
//     final adressListModel = adressListModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AdressListModel adressListModelFromJson(String str) => AdressListModel.fromJson(json.decode(str));

String adressListModelToJson(AdressListModel data) => json.encode(data.toJson());

class AdressListModel {
    String status;
    Addresses addresses;

    AdressListModel({
        required this.status,
        required this.addresses,
    });

    factory AdressListModel.fromJson(Map<String, dynamic> json) => AdressListModel(
        status: json["status"],
        addresses: Addresses.fromJson(json["addresses"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "addresses": addresses.toJson(),
    };
}

class Addresses {
    Address6835528392Fb8642407530 address6835528392Fb8642407530;

    Addresses({
        required this.address6835528392Fb8642407530,
    });

    factory Addresses.fromJson(Map<String, dynamic> json) => Addresses(
        address6835528392Fb8642407530: Address6835528392Fb8642407530.fromJson(json["address_6835528392fb86.42407530"]),
    );

    Map<String, dynamic> toJson() => {
        "address_6835528392fb86.42407530": address6835528392Fb8642407530.toJson(),
    };
}

class Address6835528392Fb8642407530 {
    String addressLine;
    String city;
    String state;
    String zipcode;
    String country;
    bool isDefault;

    Address6835528392Fb8642407530({
        required this.addressLine,
        required this.city,
        required this.state,
        required this.zipcode,
        required this.country,
        required this.isDefault,
    });

    factory Address6835528392Fb8642407530.fromJson(Map<String, dynamic> json) => Address6835528392Fb8642407530(
        addressLine: json["address_line"],
        city: json["city"],
        state: json["state"],
        zipcode: json["zipcode"],
        country: json["country"],
        isDefault: json["is_default"],
    );

    Map<String, dynamic> toJson() => {
        "address_line": addressLine,
        "city": city,
        "state": state,
        "zipcode": zipcode,
        "country": country,
        "is_default": isDefault,
    };
}
