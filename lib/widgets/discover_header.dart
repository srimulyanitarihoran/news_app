import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';

class DiscoverHeader extends StatelessWidget {
  final Function(String)? onSearch;
  final VoidCallback? onBellTap;
  final bool hasNotification;

  DiscoverHeader({
    Key? key,
    this.onSearch,
    this.onBellTap,
    this.hasNotification = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 26,
                    color: AppColors.textPrimary,
                  ),
                  children: [
                    TextSpan(
                      text: 'Discover the\n',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'news with NexNews!',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: onBellTap,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 350),
                      curve: Curves.easeOutBack,
                      height: 38,
                      width: 38,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        boxShadow: hasNotification
                            ? [
                                BoxShadow(
                                  color: Color(0x4DFF0000),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                ),
                              ]
                            : [],
                      ),
                      child: Icon(
                        hasNotification
                            ? Icons.notifications_active_rounded
                            : Icons.notifications_none_rounded,
                        color: AppColors.textPrimary,
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Icon(
                Icons.search_rounded,
                color: Color(0xB3000000),
                size: 22,
              ),
              SizedBox(width: 8),
              Expanded(
                child: TextField(
                  onChanged: onSearch,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    hintText: 'What do you want to read today?',
                    hintStyle: TextStyle(
                      color: Color(0x80000000),
                      fontSize: 16,
                    ),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.only(bottom: 8),
                  ),
                  cursorColor: Color(0x8A000000),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 2),
            height: 1,
            color: Color(0x80000000),
          ),
        ],
      ),
    );
  }
}
