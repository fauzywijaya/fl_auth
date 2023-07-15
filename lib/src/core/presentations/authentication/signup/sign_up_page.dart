import 'package:fl_auth/src/constants/constants.dart';
import 'package:fl_auth/src/router/router.dart';
import 'package:fl_auth/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Material(
                child: ButtonWidget.icon(
                  prefix: const Icon(Icons.arrow_back_ios_rounded),
                  onTap: () => context.goNamed(
                    Routes.signin.name,
                  ),
                ),
              ),
            ),
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
              "Sign Up to Create Account",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Gap.h20,
            const InputFormWidget(
              hint: "Full Name",
              icon: Icons.person_rounded,
            ),
            Gap.h20,
            const InputFormWidget(
                icon: Icons.alternate_email_rounded, hint: "Email"),
            Gap.h20,
            InputFormWidget.password(
              icon: Icons.lock_rounded,
              hint: "Password",
              onObscureTap: () {},
            ),
            Gap.h20,
            InputFormWidget.password(
              icon: Icons.lock_rounded,
              hint: "Repeat Password",
              onObscureTap: () {},
            ),
            Gap.h20,
            ButtonWidget.primary(text: "Sign In", onTap: () {}),
            Gap.h20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(
                  child: Divider(
                    color: AppColor.blue,
                    thickness: 1,
                    indent: 100,
                  ),
                ),
                Gap.w16,
                Text(
                  "Or Login With",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Gap.w16,
                const Expanded(
                  child: Divider(
                    color: AppColor.blue,
                    thickness: 1,
                    endIndent: 100,
                  ),
                ),
              ],
            ),
            Gap.h20,
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
                context.goNamed(Routes.signin.name);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Gap.w8,
                  Text(
                    "Sign In",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: AppColor.blue),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
