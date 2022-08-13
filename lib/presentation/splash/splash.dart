import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/presentation/resources/assets_manager.dart';
import 'package:flutter_mvvm_architecture/presentation/resources/color_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(child: Image.asset(AssetsManager.splashLogo)),
    );
  }
}
