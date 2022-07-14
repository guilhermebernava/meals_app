import 'dart:convert';
import 'package:flutter/material.dart';

class CategoryModel {
  final String id;
  final String title;
  final Color color;
  bool isLiked;

  CategoryModel({
    required this.id,
    required this.title,
    required this.color,
    this.isLiked = false,
  });

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      isLiked: map['isLiked'],
      color: map['color'],
      id: map['id'],
      title: map['title'],
    );
  }

  factory CategoryModel.fromJson(String json) =>
      CategoryModel.fromMap(jsonDecode(json));

  Map<String, dynamic> toMap() => {
        "id": id,
        "isLiked": isLiked,
        "color": color,
        "title": title,
      };

  String toJson() => jsonEncode(toMap());
}
