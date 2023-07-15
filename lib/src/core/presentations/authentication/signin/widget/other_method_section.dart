import 'package:fl_auth/src/constants/constants.dart';
import 'package:fl_auth/src/router/router.dart';
import 'package:fl_auth/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OtherMethodSection extends StatelessWidget {
  const OtherMethodSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ButtonWidget.icon(
              onTap: () {},
              prefix: const Icon(
                Icons.facebook_rounded,
                color: AppColor.blue,
              ),
            ),
            Gap.w8,
            ButtonWidget.icon(
              onTap: () {},
              prefix: const Icon(
                Icons.g_mobiledata_rounded,
                color: AppColor.blue,
              ),
            ),
            Gap.w8,
            ButtonWidget.icon(
              onTap: () {},
              prefix: const Icon(
                Icons.email_rounded,
                color: AppColor.blue,
              ),
            ),
          ],
        ),
        Gap.h20,
        GestureDetector(
          onTap: () {
            context.goNamed(Routes.signup.name);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Gap.w8,
              Text(
                "Sign Up",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppColor.blue),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
