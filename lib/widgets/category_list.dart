import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controllers/news_controller.dart';
import 'package:news_app/utils/category_image.dart';
import 'package:news_app/widgets/category_chip.dart';

class CategorySection extends StatelessWidget {
  final NewsController controller;

  CategorySection({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: EdgeInsets.only(left: 16),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          final category = controller.categories[index];
          return Obx(() => CategoryChip(
                label: category.capitalize ?? category,
                imageUrl: getCategoryImage(category),
                isSelected: controller.selectedCategory == category,
                onTap: () => controller.selectCategory(category),
              ));
        },
      ),
    );
  }
}
