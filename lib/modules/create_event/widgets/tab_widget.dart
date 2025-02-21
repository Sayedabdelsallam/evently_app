import 'package:evently_app/core/theme/colors.dart';
import 'package:evently_app/models/event_category.dart';
import 'package:flutter/material.dart';

class TabWidget extends StatelessWidget {
  final EventCategory eventCategory;
  final bool isSelected;

  const TabWidget({
    super.key,
    required this.eventCategory,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: isSelected ? MyColors.primary : MyColors.white,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: MyColors.primary),
      ),
      child: Row(
        children: [
          Icon(
            eventCategory.eventCategoryIcon,
            color: isSelected ? MyColors.white : MyColors.primary,
          ),
          SizedBox(width: 5),
          Text(
            eventCategory.eventCategoryName,
            style: theme.textTheme.titleMedium?.copyWith(
                color: isSelected
                    ? MyColors.white
                    : MyColors.primary),
          )
        ],
      ),
    );
  }
}