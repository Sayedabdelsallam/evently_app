import 'package:evently_app/core/theme/colors.dart';
import 'package:evently_app/models/event_category.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../settings_provider.dart';

class HomeTabWidget extends StatelessWidget {
  final EventCategory eventCategory;
  final bool isSelected;

  const HomeTabWidget({
    super.key,
    required this.eventCategory,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var provider = Provider.of<SettingsProvider>(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: isSelected
            ? provider.isDark()
                ? MyColors.white
                : MyColors.white
            : provider.isDark()
                ? Color(0xFF101127)
                : MyColors.primary,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
            color: provider.isDark() ? MyColors.primary : MyColors.white),
      ),
      child: Row(
        children: [
          Icon(
            eventCategory.eventCategoryIcon,
            color: isSelected
                ? provider.isDark()
                    ? MyColors.primary
                    : MyColors.primary
                : provider.isDark()
                    ? MyColors.primary
                    : MyColors.white,
          ),
          SizedBox(width: 5),
          Text(
            eventCategory.eventCategoryName,
            style: theme.textTheme.titleMedium?.copyWith(
              color: isSelected
                  ? provider.isDark()
                      ? MyColors.primary
                      : MyColors.primary
                  : provider.isDark()
                      ? MyColors.primary
                      : MyColors.white,
            ),
          )
        ],
      ),
    );
  }
}
