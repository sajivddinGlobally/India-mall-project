// To parse this JSON data, do
//
//     final addressBodyModel = addressBodyModelFromJson(jsonString);

import 'dart:convert';

AddressBodyModel addressBodyModelFromJson(String str) => AddressBodyModel.fromJson(json.decode(str));

String addressBodyModelToJson(AddressBodyModel data) => json.encode(data.toJson());

class AddressBodyModel {
    String addressLine;
    String city;
    String state;
    String zipcode;
    String country;
    bool isDefault;

    AddressBodyModel({
        required this.addressLine,
        required this.city,
        required this.state,
        required this.zipcode,
        required this.country,
        required this.isDefault,
    });

    factory AddressBodyModel.fromJson(Map<String, dynamic> json) => AddressBodyModel(
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
