import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final void Function(String) onSubmitted;

  const AdaptativeTextField(
      {required this.label,
      required this.controller,
      required this.keyboardType,
      required this.onSubmitted,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CupertinoTextField(
              controller: controller,
              keyboardType: keyboardType,
              onSubmitted: onSubmitted,
              placeholder: label,
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
            ),
          )
        : TextField(
            keyboardType: keyboardType,
            controller: controller,
            onSubmitted: (_) => onSubmitted,
            decoration: InputDecoration(labelText: label),
          );
  }
}
