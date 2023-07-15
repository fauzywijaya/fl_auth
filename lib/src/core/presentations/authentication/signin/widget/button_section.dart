import 'package:fl_auth/src/constants/constants.dart';
import 'package:fl_auth/src/core/presentations/presentations.dart';
import 'package:fl_auth/src/router/router.dart';
import 'package:fl_auth/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ButtonSection extends ConsumerWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(signInControllerProvider);
    final controller = ref.read(signInControllerProvider.notifier);
    ref.listen(signInControllerProvider, (previous, next) {
      next.status.maybeWhen(
          data: (data) {
            if (data == SignInStatus.granted) {
              context.goNamed(Routes.home.name);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Login Successful",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.white,
                          )),
                  backgroundColor: Colors.green,
                ),
              );
            }
          },
          orElse: () {});
    });

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
                flex: 5,
                child: ButtonWidget.primary(text: "Sign In", onTap: () {})),
            Gap.w8,
            state.hasBiometric
                ? Expanded(
                    child: ButtonWidget.icon(
                      onTap: () {
                        controller.getBiometricType().then((value) =>
                            controller.authenticate("Sign In With Biometric"));
                      },
                      prefix: const Icon(
                        Icons.fingerprint_rounded,
                        color: AppColor.blue,
                      ),
                    ),
                  )
                : Expanded(
                    child: ButtonWidget.icon(
                      isEnabled: false,
                      onTap: () {
                        // controller.getBiometricType();
                      },
                      prefix: const Icon(
                        Icons.fingerprint_rounded,
                        color: AppColor.blue,
                      ),
                    ),
                  )
          ],
        ),
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
      ],
    );
  }
}


// class ButtonSection extends ConsumerStatefulWidget {
//   const ButtonSection({super.key});

//   @override
//   ConsumerState<ButtonSection> createState() => _ButtonSectionState();
// }

// class _ButtonSectionState extends ConsumerState<ButtonSection> {
//   SignInController get controller =>
//       ref.read(signInControllerProvider.notifier);
//   SignInState get state => ref.watch(signInControllerProvider);

//   // @override
//   // void didChangeDependencies() {
//   //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//   //     controller.hasBiometric();
//   //   });
//   //   super.didChangeDependencies();
//   // }

//   @override
//   Widget build(BuildContext context) {
    
//     final biomterics = controller.getBiometricType();
    
//   }
// }
