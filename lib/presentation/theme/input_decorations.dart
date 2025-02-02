import 'package:flutter/material.dart';

class AppInputDecorations {
  static InputDecoration dropdownDecoration({
    required String labelText,
    Color borderColor = Colors.blue,
  }) {
    return InputDecoration(
      labelText: labelText,
      border: _defaultBorder(borderColor),
      enabledBorder: _defaultBorder(borderColor),
      focusedBorder: _defaultBorder(borderColor.withOpacity(0.8)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    );
  }

  static OutlineInputBorder _defaultBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: color, width: 2.0),
    );
  }
}
