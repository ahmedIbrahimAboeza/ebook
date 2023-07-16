// ignore: file_names
import 'package:flutter/material.dart';

import '../Sign/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slideAnimatiom;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slideAnimatiom =
        Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(animationController);
    animationController.forward();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 4,
            ),
            AnimatedBuilder(
              animation: slideAnimatiom,
              builder: (BuildContext context, Widget? child) {
                return SlideTransition(
                    position: slideAnimatiom,
                    child: Text("Bookify",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 50,
                            )));
              },
            )
          ],
        ),
      ),
    );
  }
}
