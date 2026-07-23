import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/constants/app_constant.dart';

import '../core/themes/theme.dart';
import 'core/di/locator.dart';
import 'core/routes.dart';
import 'features/weather/presentation/providers/weather_provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WeatherProvider>(
      create: (_) => locator<WeatherProvider>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppConstant.fontFamily,
        color: Colors.white,
        themeMode: ThemeMode.light,
        theme: CustomTheme.lightTheme,
        initialRoute: Routes.initialRoute,
        routes: Routes.routes,
      ),
    );
  }
}
