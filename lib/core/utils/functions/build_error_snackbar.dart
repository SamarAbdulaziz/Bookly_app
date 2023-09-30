import 'package:flutter/material.dart';

SnackBar buildSnackBar(String errMessage) {
  return SnackBar(
    content: Text(
      errMessage,
      style: const TextStyle(
          color: Colors.white
      ),
    ),
    backgroundColor: Colors.red,
  );
}