import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controllers/news_controller.dart';
import 'package:news_app/routes/app_pages.dart';
import 'package:news_app/widgets/loading_shimmer.dart';
import 'package:news_app/widgets/news_card.dart';
import 'error_state.dart';
import 'empty_state.dart';

class NewsListSection extends StatelessWidget {
  final NewsController controller;

  NewsListSection({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading) return LoadingShimmer();
      if (controller.error.isNotEmpty) return ErrorState();
      if (controller.articles.isEmpty) return EmptyState();

      return RefreshIndicator(
        onRefresh: controller.refreshNews,
        child: ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: controller.articles.length,
          itemBuilder: (context, index) {
            final article = controller.articles[index];
            return NewsCard(
              article: article,
              onTap: () => Get.toNamed(Routes.NEWS_DETAIL, arguments: article),
            );
          },
        ),
      );
    });
  }
}
