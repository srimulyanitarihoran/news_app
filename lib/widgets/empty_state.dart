import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/utils/app_colors.dart';

class EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 160,
            child: Lottie.asset('assets/lotties/notfound.json', repeat: true),
          ),
          SizedBox(height: 16),
          Text(
            'No news available',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Please try again later',
            style: TextStyle(color: AppColors.textSecondary),
          )
        ],
      ),
    );
  }
}
