import 'package:fl_auth/gen/assets.gen.dart';
import 'package:fl_auth/src/constants/constants.dart';
import 'package:fl_auth/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  PageController controller = PageController();

  late int index;

  @override
  void initState() {
    index = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  scrollDirection: Axis.horizontal,
                  reverse: false,
                  onPageChanged: (index) {
                    setState(() {
                      this.index = index;
                    });
                  },
                  controller: controller,
                  pageSnapping: true,
                  physics: const ClampingScrollPhysics(),
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 213.h,
                          width: 289.w,
                          child:
                              Assets.svg.onboardingOne.svg(fit: BoxFit.contain),
                        ),
                        Gap.h12,
                        Text(
                          'Welcome to Flutter',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Gap.h12,
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequa',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Gap.h32,
                        const ButtonWidget.primary(
                          text: "Get Started",
                          isEnabled: true,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 213.h,
                          width: 289.w,
                          child:
                              Assets.svg.onboardingOne.svg(fit: BoxFit.contain),
                        ),
                        Gap.h12,
                        Text(
                          'Welcome to Riverpod',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Gap.h12,
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequa',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Gap.h32,
                        const ButtonWidget.primary(
                          text: "Get Started",
                          isEnabled: true,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 213.h,
                          width: 289.w,
                          child:
                              Assets.svg.onboardingOne.svg(fit: BoxFit.contain),
                        ),
                        Gap.h12,
                        Text(
                          'Welcome to Local Auth',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Gap.h12,
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequa',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Gap.h32,
                        const ButtonWidget.primary(
                          text: "Get Started",
                          isEnabled: true,
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
