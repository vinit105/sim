import 'package:flutter/material.dart';
import 'package:untitled1/ui/constants.dart';

customTextField(
    {required String label,
    required Icon icon,
    required TextEditingController controller,
    required String? Function(String?)? validate,
    bool obscureText = false}) {
  return TextFormField(
    controller: controller,
    obscureText: obscureText,
    validator: (value) => validate!(value),
    decoration: InputDecoration(
      prefixIcon: icon,
      hintText: label,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.blue, width: 2),
      ),
      focusColor: themeColor,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: themeColor, width: 2),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: themeColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: themeColor, width: 2),
      ),
    ),
  );
}

customButton({
  required String buttonLabel,
  required Function() onPressed,
}) {
  return SizedBox(
    width: double.infinity,
    child: TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor:
            MaterialStateColor.resolveWith((states) => Colors.purple.shade200),
      ),
      child: Text(
        buttonLabel,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
