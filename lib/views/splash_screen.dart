import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:fixithandyman/views/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../util/app_constant.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});


  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 500),
          () {
        // Navigate to main screen
      },
    );
  }

  @override
  Widget build(BuildContext context){
    final String appname = "Dinissa";
    return (
        AnimatedSplashScreen(
          backgroundColor: AppConstants.primaryColor,
          splash: Image.asset('assets/images/logo.png',
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width * 0.8,),
          nextScreen:   WelcomeScreen(),
          splashTransition: SplashTransition.rotationTransition,
          pageTransitionType: PageTransitionType.fade,
        )
    );
  }

}