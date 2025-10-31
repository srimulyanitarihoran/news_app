import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/utils/app_colors.dart';

class ErrorState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 110,
            child: Lottie.asset('assets/lotties/nointernet.json', repeat: true),
          ),
          SizedBox(height: 5),
          Text(
            'Something went wrong',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Please check your internet connection',
            style: TextStyle(color: AppColors.textSecondary),
          )
        ],
      ),
    );
  }
}
