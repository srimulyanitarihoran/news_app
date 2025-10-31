import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/routes/app_pages.dart';
import 'package:news_app/utils/app_colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<String> letters = ["N", "e", "x", "N", "e", "w", "s"];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..forward();

    Future.delayed(Duration(seconds: 4), () {
      Get.offAllNamed(Routes.HOME);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            double progress = Curves.easeOutCubic.transform(_controller.value);
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedOpacity(
                  opacity: progress,
                  duration: Duration(milliseconds: 800),
                  child: Container(
                    padding: EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.newspaper_rounded,
                      color: AppColors.primary,
                      size: 52,
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(letters.length, (i) {
                    final delay = i * 0.1;
                    final localProgress =
                        (progress - delay).clamp(0.0, 1.0);
                    final opacity = localProgress;
                    final offsetY = (1 - localProgress) * 30;
                    return Opacity(
                      opacity: opacity,
                      child: Transform.translate(
                        offset: Offset(0, offsetY),
                        child: Text(
                          letters[i],
                          style: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                    );
                  }),
                ),

                SizedBox(height: 16),
                AnimatedOpacity(
                  opacity: progress > 0.8 ? 1 : 0,
                  duration: Duration(milliseconds: 800),
                  child: Text(
                    "Next Gen News, Right Now.",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
