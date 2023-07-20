import 'dart:convert';

import 'package:fl_auth/src/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'src/router/router.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  /// Creating precache assets
  void precacheAssets() async {
    final manifestJson = await rootBundle.loadString('AssetManifest.json');
    final rawAssets = json.decode(manifestJson) as Map<String, dynamic>;
    final images = rawAssets.keys
        .where((String key) => key.startsWith('assets/svg'))
        .toList();
    // final icons = rawAssets.keys
    //     .where((String key) => key.startsWith('assets/icons'))
    //     .toList();
    List<String> assets = [];
    assets.addAll(images);
    // assets.addAll(icons);

    for (var asset in assets) {
      try {
        if (asset.contains(".png")) {
          // ignore: use_build_context_synchronously
          precacheImage(AssetImage(asset), context);
        } else if (asset.contains(".svg")) {
          precachePicture(
              ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, asset),
              null);
        }
      } catch (e) {
        debugPrint("ERROR: $e");
        continue;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(goRouterProvider);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerDelegate: router.routerDelegate,
            routeInformationParser: router.routeInformationParser,
            routeInformationProvider: router.routeInformationProvider,
            title: "Flutter Auth",
            theme: AppThemes.lightTheme,
            builder: (context, child) {
              ErrorWidget.builder = (details) {
                return CustomErrorWidget(errorDetails: details);
              };
              return child ?? const Scaffold();
            },
          );
        },
      ),
    );
  }
}

class CustomErrorWidget extends StatelessWidget {
  final FlutterErrorDetails errorDetails;

  const CustomErrorWidget({
    Key? key,
    required this.errorDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(
      color: Colors.red,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "Something is not right here...",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
