import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controllers/news_controller.dart';
import 'package:news_app/routes/app_pages.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/widgets/bottom_navbar.dart';
import 'package:news_app/widgets/category_list.dart';
import 'package:news_app/widgets/discover_header.dart';
import 'package:news_app/widgets/news_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NewsController controller = Get.find<NewsController>();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DiscoverHeader(
              onSearch: (query) {
                if (query.isNotEmpty) controller.searchNews(query);
              },
              onBellTap: () => Get.toNamed(Routes.NOTIFICATION),
            ),
            CategorySection(controller: controller),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              child: Text(
                selectedIndex == 0 ? 'Home' : 'Trending Topics',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            Expanded(child: NewsListSection(controller: controller))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavbar(
        selectedIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
