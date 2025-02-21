import 'package:evently_app/core/extensions/padding_ext.dart';
import 'package:evently_app/core/theme/colors.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../../core/routs/pages_route_name.dart';
import '../../core/services/firebase_firestore_services.dart';
import '../../core/services/snack_bar_services.dart';
import '../../core/widgets/custom_elevated_button.dart';
import '../../main.dart';
import '../../models/event_model.dart';

class EventDetails extends StatelessWidget {
   const EventDetails({super.key, required this.eventDataModel,});
  final  EventDataModel eventDataModel;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var args = ModalRoute.of(context)!.settings.arguments as EventDataModel;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: MyColors.primary,
            ),
        ),
        title: Text(
            'Event Details',
          style: theme.textTheme.headlineSmall?.copyWith(
            color: MyColors.primary
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed:()
            {
              Navigator.pushNamed(context, PagesRouteName.eventEdit , arguments: eventDataModel);
            } ,
            icon: Icon(Icons.edit_note_outlined,
            color: MyColors.primary,
              size: 24  ,
            ),
          ),
          IconButton(
            onPressed: () async {
              bool confirmDelete = await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Confirm Delete"),
                    content: Text("Are you sure you want to delete this event?"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, false), // إلغاء
                        child: Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, true), // تأكيد الحذف
                        child: Text("Delete", style: TextStyle(color: Colors.red)),
                      ),
                    ],
                  );
                },
              );

              if (confirmDelete == true) {
                EasyLoading.show(status: "Deleting...");

                bool isDeleted = await FirebaseFirestoreService.deleteEvent(args);

                EasyLoading.dismiss();

                if (isDeleted) {
                  navigatorKey.currentState!.pop();
                  SnackBarServices.showSuccessMessage("Event deleted successfully");
                } else {
                  SnackBarServices.showErrorMessage("Failed to delete event. Try again!");
                }
              }
            },
            icon: Icon(
              Icons.delete_forever_outlined,
              color: Colors.red,
              size: 24.0,
            ),
          ),

        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
                image:AssetImage(
                  eventDataModel.eventImage,
                ) ,
            ),
            SizedBox(height: size.height * 0.01,),
            Text(
              eventDataModel.eventTitle,
              style: theme.textTheme.headlineMedium?.copyWith(
                color: MyColors.primary,
                fontWeight: FontWeight.w500,
              ),),
            SizedBox(height: size.height * 0.01,),
            CustomElevatedButton(
              onTab: (){},
              liftIcon: Icons.calendar_month_outlined,
              title: DateFormat(" dd MMMM yyyy ").format(eventDataModel.eventDate),
            ),
            SizedBox(height: size.height * 0.02,),
            CustomElevatedButton(
              onTab: (){},
              liftIcon: Icons.location_on_outlined,
              title: 'Ismailia, Egypt',
            ),
            SizedBox(height: size.height * 0.02,),
            Container(
              width: double.infinity,
              height: size.height * 0.38,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: MyColors.primary),
              ),
              child: GoogleMap(initialCameraPosition: CameraPosition(
                  target: LatLng( 50.86 ,48.57), zoom: 5),
                mapType: MapType.normal,
                markers: <Marker>{
                  Marker(markerId: MarkerId('1'),
                      position: LatLng( 50.86 ,48.57),)
                },
                zoomControlsEnabled: false,
              ),
            ),
            SizedBox(height: size.height * 0.02,),
            Text(
              'Description',
              style: theme.textTheme.titleLarge?.copyWith(
                color: MyColors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: size.height * 0.02,),
            Text(
              eventDataModel.eventDescription,
              style: theme.textTheme.titleLarge?.copyWith(
                color: MyColors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: size.height * 0.05,),
          ],
        ).setHorizontalPadding(context, 0.03),
      ),
    );
  }
}
