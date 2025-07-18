import 'package:flutter/material.dart';

class LabelledTextField extends StatefulWidget {
  final String label;
  final double screenWidth;
  final String hintText;
  final bool isPortrait;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String? infoText;

  const LabelledTextField({
    super.key,
    required this.label,
    required this.screenWidth,
    required this.hintText,
    required this.isPortrait,
    required this.obscureText,
    this.validator,
    this.controller,
    this.infoText,
  });

  @override
  State<LabelledTextField> createState() => _LabelledTextFieldState();
}

class _LabelledTextFieldState extends State<LabelledTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            text: widget.label,
            children: [
              TextSpan(
                text: ' *',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: widget.screenWidth * 0.035,
                ),
              ),
            ],
          ),
          style: TextStyle(
            fontSize: widget.screenWidth * 0.04,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: widget.screenWidth * 0.015),
        TextFormField(
          controller: widget.controller,
          obscureText: _obscureText,
          autovalidateMode: AutovalidateMode.onUserInteraction, // ✅ Real-time validation
          style: TextStyle(fontSize: widget.screenWidth * 0.035),
          validator: widget.validator,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(fontSize: widget.screenWidth * 0.035),
            contentPadding: EdgeInsets.symmetric(
              vertical: (widget.isPortrait ? widget.screenWidth * 0.02 : widget.screenWidth * 0.03),
              horizontal: widget.screenWidth * 0.04,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.screenWidth * 0.03),
            ),
            suffixIcon: widget.obscureText
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : null,
          ),
        ),
        if (widget.infoText != null)
          Padding(
            padding: EdgeInsets.only(top: widget.screenWidth * 0.015),
            child: Text(
              widget.infoText!,
              style: TextStyle(
                fontSize: widget.screenWidth * 0.03,
                color: Colors.grey[600],
              ),
            ),
          ),
      ],
    );
  }
}