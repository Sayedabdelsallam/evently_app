import 'package:evently_app/core/extensions/dimensions.dart';
import 'package:evently_app/core/services/firebase_firestore_services.dart';
import 'package:evently_app/core/theme/colors.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/routs/pages_route_name.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.eventDataModel});
  final EventDataModel eventDataModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        Navigator.pushNamed(context, PagesRouteName.eventDetails , arguments: eventDataModel);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        width: 0.9.width,
        height: 0.25.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image:  DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
                eventDataModel.eventImage,
            ),
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
              child:  Text(
                DateFormat(" dd \n MMM ").format(eventDataModel.eventDate),
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
                   Expanded(
                    child: Text(
                      eventDataModel.eventDescription,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 16,
                        color: MyColors.black,
                      ),
                    ),
                  ),
                  8.spaceHorizontal,
                   GestureDetector(
                     onTap: ()
                     {
                       eventDataModel.isFavorite = !eventDataModel.isFavorite;
                       FirebaseFirestoreService.updateEvent(eventDataModel);
                     } ,
                     child: eventDataModel.isFavorite ? Icon(
                      Icons.favorite,
                      color: MyColors.primary,
                    ) : Icon(
                      Icons.favorite_border,
                      color: MyColors.primary,
                    ),
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}