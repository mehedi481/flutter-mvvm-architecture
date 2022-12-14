import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/presentation/resources/routes_manager.dart';
import '../presentation/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  MyApp._internal();  // This is called Named Constructor
  static final MyApp instance = MyApp._internal();  // make instance of this class
  factory MyApp() => instance; // When call Root Class then root call will return our named constructor

  int state = 0;  // For testing we are make this variable

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
    );
  }
}
