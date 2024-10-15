import 'package:reservon/utilities/exports.dart';

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool obscureText;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.controller,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: AppColors.grey3),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        contentPadding: EdgeInsets.fromLTRB(12, 20, 12, 12),
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey3, width: 2.0),
        ),
        suffixIcon: obscureText ? Icon(Icons.visibility_off) : null,
      ),
    );
  }
}