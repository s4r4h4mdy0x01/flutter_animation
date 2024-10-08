import 'package:flutter/material.dart';
import 'package:flutter_animation/ui/home/home.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _initializeAnimationController();
  }

  void _initializeAnimationController() {
    _animationController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _navigateToHomeScreen() {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const HomeScreen(),
        transitionsBuilder: _buildTransition,
      ),
    );
  }

  void _onLottieLoaded(LottieComposition composition) {
    _animationController
      ..duration = composition.duration * 0.3
      ..forward().then((_) {
        _navigateToHomeScreen();
      });
  }

  Widget _buildTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    var begin = const Offset(0.0, 1.0);
    var end = Offset.zero;
    var curve = Curves.easeIn;

    var tween =
        Tween<Offset>(begin: begin, end: end).chain(CurveTween(curve: curve));
    var offsetAnimation = animation.drive(tween);

    return SlideTransition(
      position: offsetAnimation,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          fit: BoxFit.cover,
          'assets/animation/animation_splash.json',
          controller: _animationController,
          onLoaded: _onLottieLoaded,
        ),
      ),
    );
  }
}
