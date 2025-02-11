import 'package:evently_app/core/extensions/dimensions.dart';
import 'package:evently_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomTapBarItem extends StatelessWidget {
  const CustomTapBarItem({
    super.key,
    required this.size,
    required this.title,
    required this.icon,
    required this.isSelected
  });

  final Size size;
  final String title;
  final IconData icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14 ,vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? MyColors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: MyColors.white)
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: isSelected ? MyColors.primary : MyColors.white,
          ),
          4.spaceHorizontal,
          Text(
            title,
            style: TextStyle(
                color: isSelected ? MyColors.primary : MyColors.white,
                fontSize: size.height * 0.019,
                fontWeight: FontWeight.w500
            ),
          ),
        ],
      ),
    );
  }
}