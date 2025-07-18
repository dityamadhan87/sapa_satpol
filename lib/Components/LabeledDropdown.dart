import 'package:flutter/material.dart';

class CustomDropdownField<T> extends StatelessWidget {
  final String label;
  final bool required;
  final String? hintText;
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final FormFieldValidator<T>? validator;
  final void Function(T?)? onChanged;
  final void Function(T?)? onSaved;
  final AutovalidateMode? autovalidateMode;

  const CustomDropdownField({
    super.key,
    required this.label,
    this.required = false,
    this.hintText,
    required this.items,
    this.value,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.autovalidateMode,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: TextStyle(
              fontSize: (isPortrait ? screenWidth * 0.045 : screenWidth * 0.03),
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            children: required
                ? const [
                    TextSpan(
                      text: ' *',
                      style: TextStyle(color: Colors.red),
                    ),
                  ]
                : [],
          ),
        ),
        SizedBox(height: screenWidth * 0.02),
        DropdownButtonFormField<T>(
          value: value,
          autovalidateMode: autovalidateMode,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.black),
            contentPadding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.06,
              vertical: screenWidth * 0.027,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          isExpanded: true,
          items: items,
          onChanged: onChanged,
          onSaved: onSaved,
          validator: validator,
        ),
      ],
    );
  }
}