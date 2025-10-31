import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';

class LoadingShimmer extends StatefulWidget {
  const LoadingShimmer({super.key});

  @override
  State<LoadingShimmer> createState() => _LoadingShimmerState();
}

class _LoadingShimmerState extends State<LoadingShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: -1.0, end: 2.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.only(bottom: 16),
          elevation: 3,
          color: AppColors.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(14)),
                child: AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Container(
                      height: 180,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(-1, 0),
                          end: Alignment(1, 0),
                          colors: [
                            AppColors.divider.withValues(alpha: 0.3),
                            AppColors.divider.withValues(alpha: 0.1),
                            AppColors.divider.withValues(alpha: 0.3),
                          ],
                          stops: [0.0, 0.5, 1.0],
                          transform: GradientRotation(
                            _animation.value * 3.14159,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildShimmerLine(width: 80, height: 10),
                    SizedBox(height: 10),
                    _buildShimmerLine(width: screenWidth * 0.9, height: 16),
                    SizedBox(height: 8),
                    _buildShimmerLine(width: screenWidth * 0.7, height: 16),
                    SizedBox(height: 10),
                    _buildShimmerLine(width: screenWidth * 0.85, height: 14),
                    SizedBox(height: 6),
                    _buildShimmerLine(width: screenWidth * 0.5, height: 14),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildShimmerLine({required double width, required double height}) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              begin: Alignment(-1, 0),
              end: Alignment(1, 0),
              colors: [
                AppColors.divider.withOpacity(0.3),
                AppColors.divider.withOpacity(0.1),
                AppColors.divider.withOpacity(0.3),
              ],
              stops: const [0.0, 0.5, 1.0],
              transform: GradientRotation(_animation.value * 3.14159),
            ),
          ),
        );
      },
    );
  }
}
