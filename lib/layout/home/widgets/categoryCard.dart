import 'package:evently_app/core/extensions/dimensions.dart';
import 'package:evently_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: 0.9.width,
      height: 0.25.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/images/meetingCard.png"),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: MyColors.lightCyan,
            ),
            child: const Text(
              "21\nNOV",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: MyColors.primary,
              ),
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: MyColors.white,
            ),
            child:  Row(
              children: [
                const Expanded(
                  child: Text(
                    "Meeting for Updating The Development Method ",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 16,
                      color: MyColors.black,
                    ),
                  ),
                ),
                8.spaceHorizontal,
                const Icon(
                  Icons.favorite,
                  color: MyColors.primary,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}