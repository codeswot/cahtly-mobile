import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    this.labe,
    this.hint,
    this.controller,
    this.isPasswordField = false,
    this.isPasswordVisible = false,
    this.inputType,
    this.validator,
    this.onPasswordVisibilityChanged,
  });
  final String? labe;
  final String? hint;
  final TextEditingController? controller;
  final bool isPasswordField;
  final bool isPasswordVisible;
  final TextInputType? inputType;
  final String? Function(String?)? validator;
  final VoidCallback? onPasswordVisibilityChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      obscureText: isPasswordVisible,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        border: const OutlineInputBorder(),
        labelText: labe,
        hintText: hint,
        suffixIcon: isPasswordField
            ? IconButton(
                icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: onPasswordVisibilityChanged,
              )
            : null,
      ),
    );
  }
}
