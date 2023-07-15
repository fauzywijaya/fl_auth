import 'package:fl_auth/src/constants/constants.dart';
import 'package:flutter/material.dart';

class TitleInforSection extends StatelessWidget {
  const TitleInforSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Flutter-Auth",
          style: Theme.of(context)
              .primaryTextTheme
              .headlineLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          "Authentication made easy",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColor.grey,
              ),
        ),
        Gap.h36,
        Text(
          "Sign In to Your Account",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}
