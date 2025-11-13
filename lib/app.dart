import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:travel_app_youtube/router.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light, fontFamily: 'geo'),
      darkTheme: ThemeData(brightness: Brightness.dark),
      builder: (context, child) {
        return ResponsiveSizer(
          builder: (context, orientation, screenType) => child!,
        );
      },
      routerConfig: RouterConf.goRouter,
    );
  }
}
