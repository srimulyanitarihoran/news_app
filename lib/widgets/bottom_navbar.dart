import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const BottomNavbar({
    Key? key,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavItem(index: 0, label: "HOME", icon: Icons.home_filled),
          _buildNavItem(
            index: 1,
            label: "TRENDING",
            icon: Icons.local_fire_department_rounded,
            isFireIcon: true,
          ),
          _buildNavItem(index: 2, label: "PROFILE", icon: Icons.person_rounded),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required String label,
    required IconData icon,
    bool isFireIcon = false,
  }) {
    bool isActive = selectedIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: isActive
            ? EdgeInsets.symmetric(horizontal: 24, vertical: 10)
            : EdgeInsets.symmetric(horizontal: 4, vertical: 6),
        decoration: BoxDecoration(
          color: isActive ? Color(0xFF06111B) : Colors.transparent,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedSwitcher(
              duration: Duration(milliseconds: 250),
              transitionBuilder: (child, anim) =>
                  ScaleTransition(scale: anim, child: child),
              child: isActive
                  ? Container(
                      key: ValueKey(index),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(0xFFFF9F43),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        icon,
                        size: 22,
                        color: Colors.black,
                      ),
                    )
                  : SizedBox.shrink(),
            ),
            if (isActive) SizedBox(width: 10),
            AnimatedDefaultTextStyle(
              duration: Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              style: TextStyle(
                fontSize: isActive ? 18 : 14,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                color: isActive ? Colors.white : Colors.black.withValues(alpha: 0.7),
              ),
              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }
}
