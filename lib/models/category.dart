import 'package:flutter/material.dart';

///
/// Model from Category object
///
class Category {

  final String id;
  final String title;
  final Color color;

  const Category({ required this.id, required this.title, this.color = Colors.orange});

}