import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class AppInputDecorations {
  static InputDecoration dropdownDecoration({
    required String labelText,
    Color borderColor = AppColors.primary,

  }) {
    return InputDecoration(
      labelText: labelText,
      border: _defaultBorder(borderColor),
      enabledBorder: _defaultBorder(borderColor),
      focusedBorder: _defaultBorder(borderColor.withOpacity(0.8)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    );
  }

  static OutlineInputBorder _defaultBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: color, width: 2.0),
    );
  }
}
