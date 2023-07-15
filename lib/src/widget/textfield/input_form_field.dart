// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:fl_auth/src/constants/constants.dart';

enum InputFormType {
  normal,
  password,
}

class InputFormWidget extends StatelessWidget {
  final IconData? icon;
  final String hint;
  final TextEditingController? controller;
  final Function(String value)? onChanged;
  final VoidCallback? onTap;
  final int? maxLines;
  final InputFormType type;
  final TextInputType? keyboardType;
  final bool isObscure;
  final Function()? onObscureTap;
  final IconData? suffixIcon;
  final String? Function(String?)? validator;
  const InputFormWidget({
    super.key,
    this.icon,
    required this.hint,
    this.controller,
    this.onChanged,
    this.keyboardType,
    this.validator,
  })  : type = InputFormType.normal,
        suffixIcon = null,
        onTap = null,
        maxLines = 1,
        onObscureTap = null,
        isObscure = false;

  const InputFormWidget.password({
    super.key,
    this.controller,
    required this.hint,
    this.onChanged,
    this.icon,
    this.isObscure = true,
    this.onObscureTap,
    this.validator,
    this.keyboardType,
    this.suffixIcon,
  })  : type = InputFormType.password,
        maxLines = 1,
        onTap = null;

  bool get isPassword => type == InputFormType.password;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: isObscure,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 16, color: Colors.black45),
        fillColor: Colors.white,
        filled: true,
        prefixIcon: Padding(
          padding: EdgeInsets.only(right: AppSizes.w4),
          child: Material(
            color: AppColor.blue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppSizes.r12),
              bottomLeft: Radius.circular(AppSizes.r12),
            ),
            child: Icon(icon, color: Colors.white),
          ),
        ),
        suffixIcon: isPassword
            ? GestureDetector(
                onTap: onObscureTap,
                child: Icon(
                  isObscure
                      ? Icons.visibility_rounded
                      : Icons.visibility_off_rounded,
                  color: AppColor.blue,
                ),
              )
            : const SizedBox.shrink(),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.r12),
          borderSide: const BorderSide(color: Colors.red, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.r12),
          borderSide: const BorderSide(color: AppColor.blue, width: 1.0),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizes.r12),
            borderSide: const BorderSide(color: AppColor.grey, width: 1.0)),
      ),
    );
  }
}
