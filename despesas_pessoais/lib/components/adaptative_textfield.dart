import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;

  AdaptativeTextField({
    required this.label,
    required this.controller,
    required this.textInputAction,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoTextField(
            controller: controller,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            placeholder: label,
          )
        : TextField(
            controller: controller,
            decoration: InputDecoration(labelText: label),
            keyboardType: keyboardType,
            textInputAction: textInputAction,
          );
  }
}
