import 'package:flutter/material.dart';

class proudactModel {
  late String name, image, price, description, size;

  proudactModel({
    required this.description,
    required this.price,
    required this.name,
    required this.image,
    required this.size,
  });

  proudactModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    price = map['price'];
    description = map['description'];
    name = map['name'];
    image = map['image'];
    size = map['size'];
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
