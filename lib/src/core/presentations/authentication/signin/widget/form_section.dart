import 'package:fl_auth/src/constants/constants.dart';
import 'package:fl_auth/src/widget/widget.dart';
import 'package:flutter/material.dart';

class FormSection extends StatelessWidget {
  const FormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const InputFormWidget(
            icon: Icons.alternate_email_rounded, hint: "Email"),
        Gap.h20,
        InputFormWidget.password(
          icon: Icons.lock_rounded,
          hint: "Password",
          onObscureTap: () {},
        ),
        Gap.h20,
        const Align(
          alignment: Alignment.centerRight,
          child: Text(
            "Forgot Password?",
            style: TextStyle(
              color: AppColor.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
