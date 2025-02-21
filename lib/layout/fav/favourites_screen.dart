import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/core/extensions/extensions.dart';
import 'package:flutter/material.dart';

import '../../core/services/firebase_firestore_services.dart';
import '../../core/theme/colors.dart';
import '../../core/widgets/custom_text_form.dart';
import '../../models/event_model.dart';
import '../home/widgets/categoryCard.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context);
    var theme = Theme.of(context);
    return SafeArea(
      child: Column(
        children:  [
          const CustomTextField(
            hint: "Search For Event",
            hintColor: MyColors.gray,
            prefixIcon: Icon(
              Icons.search,
              color: MyColors.gray,
            ),
          ).setHorizontalPadding(context, 0.02),
          SizedBox(
            height: size.size.height * 0.02,
          ),
          StreamBuilder<QuerySnapshot<EventDataModel>>(
            stream: FirebaseFirestoreService.getStreamFavouriteData(),
            builder: (builder, snapshot) {
              if(snapshot.hasError)
              {
                return Column(
                  children: [
                    Text('Something went wrong'),
                    20.spaceVertical,
                    IconButton(
                      onPressed: (){},
                      icon: Icon(
                        Icons.refresh,
                        color: MyColors.primary,
                      ),
                    ),
                  ],
                );
              }

              if(snapshot.connectionState == ConnectionState.waiting)
              {
                return Center(child: CircularProgressIndicator(color: MyColors.primary,));
              }

              List<EventDataModel> eventDataList = snapshot.data!.docs.map(
                      (element)
                  {
                    return element.data();
                  }).toList();

              return eventDataList.isNotEmpty ? Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (context, index) => CategoryCard(eventDataModel: eventDataList[index],),
                  separatorBuilder: (context, index) => 16.spaceVertical,
                  itemCount: eventDataList.length ,
                ),
              ) : Center(child: Text(
                'No Events',
                style: theme.textTheme.titleLarge,
              ),);
            },
          ),
        ],
      ),
    );
  }
}
