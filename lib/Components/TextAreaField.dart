import 'package:flutter/material.dart';

class TextAreaField extends StatelessWidget {
  final String label;
  final String? initialValue;
  final int minLines;
  final int maxLines;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const TextAreaField({
    super.key,
    required this.label,
    this.initialValue,
    this.minLines = 4,
    this.maxLines = 6,
    this.controller,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isPotrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: TextStyle(
              fontSize: (isPotrait ? screenWidth * 0.045 : screenWidth * 0.03),
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            children: const [
              TextSpan(
                text: ' *',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
        SizedBox(height: screenWidth * 0.02),
        TextFormField(
          style: TextStyle(
            fontSize: (isPotrait ? screenWidth * 0.04 : screenWidth * 0.025),
            color: Colors.black,
          ),
          controller: controller,
          initialValue: controller == null ? initialValue : null,
          minLines: minLines,
          maxLines: maxLines,
          validator: validator,
          onChanged: onChanged,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: screenWidth * 0.035,
              horizontal: screenWidth * 0.05,
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: 'Tulis sesuatu...',
            hintStyle: TextStyle(
              fontSize: (isPotrait ? screenWidth * 0.04 : screenWidth * 0.025),
              color: Colors.grey.shade600,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.blue),
            ),
          ),
        ),
        SizedBox(height: screenWidth * 0.05), 
        Text(
          'Tulis pelanggaran dengan baik dan benar!',
          style: TextStyle(
            fontSize: (isPotrait ? screenWidth * 0.035 : screenWidth * 0.025),
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}