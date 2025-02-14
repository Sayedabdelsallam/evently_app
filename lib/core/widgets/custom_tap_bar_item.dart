import 'package:evently_app/core/extensions/dimensions.dart';
import 'package:evently_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomTapBarItem extends StatelessWidget {
  const CustomTapBarItem({
    super.key,
    required this.size,
    required this.title,
    required this.icon,
    required this.isSelected,
     this.isHomeTab = true,
  });

  final Size size;
  final String title;
  final IconData icon;
  final bool isSelected;
  final bool isHomeTab;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14 ,vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? (isHomeTab ?MyColors.white : MyColors.primary) : Colors.transparent,
        borderRadius: BorderRadius.circular(37),
        border: Border.all(
            color: isHomeTab ?MyColors.white : MyColors.primary,
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: isSelected
                ? (isHomeTab ?MyColors.primary : MyColors.white)
                : (isHomeTab ?MyColors.white : MyColors.primary),
          ),
          4.spaceHorizontal,
          Text(
            title,
            style: TextStyle(
                color: isSelected
                    ? (isHomeTab ?MyColors.primary : MyColors.white)
                    : (isHomeTab ?MyColors.white : MyColors.primary),
                fontSize: size.height * 0.019,
                fontWeight: FontWeight.w500
            ),
          ),
        ],
      ),
    );
  }
}