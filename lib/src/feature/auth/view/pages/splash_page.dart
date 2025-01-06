import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2CCD53),
      body: Center(
        child: SvgPicture.asset('assets/icons/splash_icon.svg'),
      ),
    );
  }
}
