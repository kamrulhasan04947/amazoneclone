import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

void showSnakeBar(
  BuildContext context,
  String text,
){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(text))
  );
}