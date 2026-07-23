import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/presentation/screens/home_screen.dart';

import '../../../../core/di/locator_service.dart';
import '../widgets/gradient_background.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _hideScreen() async {
    Future.delayed(const Duration(milliseconds: 50), () {
      setState(() {
        logoOpacity = 1;
      });
    });
    Widget myScreen;
    String myRoute;
    // await appSettings.getStoredLanguageAndTheme();
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

  double logoOpacity = 0.0;

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
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //
            //   children: [const AppLogo()],
            // ),
            // 320.heightSpace,
            Text(
              '${"S.of(context).version"} 1.8.2',
              style: TextStyle(color: Colors.black),
            ),
            // 30.heightSpace,
          ],
        ),
      ),
    );
  }
}
