import 'dart:convert';

import 'package:flutter/material.dart';

class Product {
    String image, title, description, category;
    int id, size, total;
    double price;
    Color color;
    bool isSelected, isliked;

    Product({this.total, this.image, this.title, this.description, this.price, this.size, this.id, this.color, this.isliked = false, this.isSelected = false, this.category});

    Product.fromDb(Map<String, dynamic> json)
        : this.id = json["id"].toInt(),
            this.title = json["title"],
            this.description = json["description"],
            this.category = json["category"],
            this.image = json["image"],
            this.price = json["price"],
            this.size = json["size"],
            this.color = null,
            this.isSelected = json["isSelected"],
            this.isliked = json["isliked"],
            this.total = json["total"];

    Map<String, dynamic> toMap() {
        return {
            'id': id,
            'title': title,
            'description': description,
            'image': image,
            'price': price,
            'size': size,
            'total': total,
        };
    }

    static Map<String, dynamic> buidData(clientId, direction, phone, clientIdentity, clientName, paymentMethod, products) {
      Map<String, dynamic> data = {
        "order": {
          "clientId": clientId,
          "direction": direction,
          "products": products
        },
        "bill" : {
          "phone": phone,
          "clientIdentity": clientIdentity,
          "clientName": clientName,
          "paymentMethod": paymentMethod
        }
      };
      return data;
    }
}