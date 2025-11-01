import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final String imageUrl;

  const CategoryChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(40),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Color(0xFF06111B),
            borderRadius: BorderRadius.circular(40),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipOval(
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: 34,
                  height: 34,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    width: 34,
                    height: 34,
                    color: Colors.grey.shade200,
                  ),
                  errorWidget: (context, url, error) => Container(
                    width: 34,
                    height: 34,
                    color: Colors.grey.shade200,
                    child: Icon(Icons.image_not_supported, size: 18),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Padding(
                padding: EdgeInsets.only(bottom: 2),
                child: Text(
                  label.toUpperCase(),
                  style: TextStyle(
                    color: isSelected ? Colors.black : Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
