import 'package:alt_access/ui/widgets/neumorphic_text_field_container.dart';
import 'package:flutter/material.dart';

class RectangularInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  const RectangularInputField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.obscureText,
    this.keyboardType = TextInputType.text,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicTextFieldContainer(
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        cursorColor: Colors.black,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          helperStyle: TextStyle(
            color: Colors.black.withOpacity(0.7),
            fontSize: 18,
          ),
          prefixIcon: Icon(
            icon,
            color: Colors.black.withOpacity(0.9),
            size: 20,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
