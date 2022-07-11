import 'package:flutter/material.dart';

class offersModel {
  late String name, image, price, description, size, discount, oldprice;

  offersModel({
    required this.description,
    required this.price,
    required this.name,
    required this.image,
    required this.size,
    required this.discount,
    required this.oldprice,
  });

  offersModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    price = map['price'];
    description = map['description'];
    name = map['name'];
    image = map['image'];
    size = map['size'];
    discount = map['discount'];
    oldprice = map['oldprice'];
  }

  toJson() {
    return {
      'image': image,
      'name': name,
      'price': price,
      'description': description
    };
  }
}
