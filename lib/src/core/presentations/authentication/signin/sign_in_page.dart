import 'package:flutter/material.dart';
import 'package:fl_auth/src/constants/constants.dart';
import 'widget/widget.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteClear,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.w16),
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  const TitleInforSection(),
                  Gap.h20,
                  const FormSection(),
                  Gap.h20,
                  const ButtonSection(),
                  Gap.h20,
                  const OtherMethodSection()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
