import 'package:flutter/material.dart';
import '../theme/input_decorations.dart';

class CustomDropdown<T> extends StatelessWidget {
  final String label;
  final T value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;


  const CustomDropdown({
    Key? key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      decoration: AppInputDecorations.dropdownDecoration(
        labelText: label,
      ),
      value: value,
      items: items,
      onChanged: onChanged,
      isExpanded: true,
    );
  }
}
