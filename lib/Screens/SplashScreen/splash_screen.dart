import 'package:artificially_unified_responsive_intelligent_xpert/Bloc/SplashScreen/splash_bloc.dart';
import 'package:artificially_unified_responsive_intelligent_xpert/Bloc/SplashScreen/splash_event.dart';
import 'package:artificially_unified_responsive_intelligent_xpert/Bloc/SplashScreen/splash_state.dart';
import 'package:artificially_unified_responsive_intelligent_xpert/Screens/HomePage/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 2,
      ),
    )..repeat(
        reverse: true,
      );

    _animation = Tween<double>(
      begin: 0.8,
      end: 1.2,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashBloc()..add(StartSplash()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashFinished) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const HomePage(),
              ),
            );
          }
        },
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: ScaleTransition(
              scale: _animation,
              child: Image.asset(
                "lib/Assets/splash_logo.png",
                width: 220,
                height: 220,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
