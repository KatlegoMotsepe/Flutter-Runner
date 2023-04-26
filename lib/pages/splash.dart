import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_application_1/pages/login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.height;

    return AnimatedSplashScreen(
      splash: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final height = constraints.maxHeight;

            return Column(
              children: [
                Container(
                  height: height * 0.20, // 30% of the height
                  width: width,

                  child: const Center(child: SizedBox()),
                ),
                Container(
                  width: width,
                  height: height * 0.5,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: const CircleAvatar(
                          radius: 100, // Image radius
                          backgroundColor: const Color.fromRGBO(223, 62, 0, 1),

                          foregroundColor: const Color.fromRGBO(223, 62, 0, 1),
                          backgroundImage: AssetImage(
                            'assets/running-man.png',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Flutter runner",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: height * 0.30,
                  width: width,
                  child: Column(
                    children: [
                      const Text(
                        "developed by",
                        style: TextStyle(color: Colors.white),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        height: 150,
                        width: 150,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage("assets/personal_logo.png"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
      duration: 2500,
      nextScreen: const LoginPage(),
      
      splashTransition: SplashTransition.slideTransition,
      pageTransitionType: PageTransitionType.rightToLeftWithFade,
      backgroundColor: const Color.fromRGBO(223, 62, 0, 1),
      splashIconSize: deviceHeight,
    );
  }
}
// TokenManager().validToken ? const WelcomePage() :