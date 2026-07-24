import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_app/core/widgets/animated_fade_scale_wrapper.dart';
import 'package:weather_app/features/weather/presentation/screens/home_screen.dart';

import '../../../../core/di/locator_service.dart';
import '../../../../core/widgets/app_logo.dart';
import '../../../../core/widgets/gradient_background.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _hideScreen() async {
    Widget myScreen;
    String myRoute;
    myScreen = const HomeScreen();
    myRoute = HomeScreen.routeName;
    Timer(const Duration(milliseconds: 1000), () async {
      await LocatorService.navigationService.currentState?.pushReplacement(
        PageRouteBuilder(
          opaque: true,
          settings: RouteSettings(name: myRoute),
          transitionDuration: const Duration(milliseconds: 900),
          pageBuilder: (BuildContext context, _, __) => myScreen,
          transitionsBuilder:
              (_, Animation<double> animation, __, Widget child) =>
                  FadeTransition(opacity: animation, child: child),
        ),
      );
    });
  }

  @override
  void initState() {
    _hideScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [AnimatedFadeScaleWrapper(child: const AppLogo())],
            ),
          ],
        ),
      ),
    );
  }
}
