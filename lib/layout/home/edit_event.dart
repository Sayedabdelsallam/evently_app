import 'package:evently_app/core/extensions/dimensions.dart';
import 'package:evently_app/core/extensions/padding_ext.dart';
import 'package:evently_app/core/services/snack_bar_services.dart';
import 'package:evently_app/core/theme/colors.dart';
import 'package:evently_app/core/widgets/custom_text_form.dart';
import 'package:evently_app/main.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:evently_app/modules/create_event/widgets/tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import "package:intl/intl.dart";
import '../../core/services/firebase_firestore_services.dart';
import '../../models/event_category.dart';

class EditEvent extends StatefulWidget {
  const EditEvent({super.key});

  @override
  State<EditEvent> createState() => _EditEventScreenState();
}

class _EditEventScreenState extends State<EditEvent> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  int selectedTab = 0;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  List<EventCategory> eventCategories = [
    EventCategory(
      eventCategoryName: "Book Club",
      eventCategoryIcon: Icons.menu_book_outlined,
      eventCategoryImg: "assets/images/bookClubCard.png",
    ),
    EventCategory(
        eventCategoryName: "Sport",
        eventCategoryIcon: Icons.directions_bike,
        eventCategoryImg: "assets/images/sportsCard.png"),
    EventCategory(
        eventCategoryName: "BirthDay",
        eventCategoryIcon: Icons.cake_outlined,
        eventCategoryImg: "assets/images/birthDayCard.png"),
    EventCategory(
        eventCategoryName: "Meeting",
        eventCategoryIcon: Icons.meeting_room_outlined,
        eventCategoryImg: "assets/images/meetingCard.png"),
    EventCategory(
        eventCategoryName: "Holiday",
        eventCategoryIcon: Icons.holiday_village_outlined,
        eventCategoryImg: "assets/images/holidayCard.png"),
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var size = MediaQuery.of(context).size;
    final args = ModalRoute.of(context)!.settings.arguments as EventDataModel;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: MyColors.primary,
            size: size.height * 0.03,
          ),
        ),
        title: Text(
          'Edit Event',
          style: TextStyle(
            color: MyColors.primary,
            fontSize: size.height * 0.025,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 1.0.width,
                height: 0.26.height,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.asset(
                    args.eventImage ??
                    eventCategories[selectedTab].eventCategoryImg,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              DefaultTabController(
                length: 5,
                child: TabBar(
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    indicatorPadding: EdgeInsets.zero,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 6.0),
                    padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                    indicator: const BoxDecoration(),
                    onTap: (value) {
                      setState(() {
                        selectedTab = value;
                      });
                    },
                    tabs: eventCategories.map(
                          (element) {
                        return TabWidget(
                          eventCategory: element,
                          isSelected:
                          selectedTab == eventCategories.indexOf(element),
                        );
                      },
                    ).toList()),
              ),
              const SizedBox(height: 10),
              Text(
                "Title",
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              CustomTextField(
                controller: titleController,
                hint: args.eventTitle,
                hintColor: MyColors.gray,
                prefixIcon: const Icon(
                  Icons.edit_note_outlined,
                  color: MyColors.gray,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Description",
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              CustomTextField(
                controller: descriptionController,
                hint: args.eventDescription,
                hintColor: MyColors.gray,
                maxLines: 4,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Icon(Icons.calendar_month),
                  const SizedBox(width: 10),
                  Text(
                    "Event Date",
                    style: theme.textTheme.titleMedium,
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      selectEventDate(context);
                    },
                    child: Text(
                      selectedDate != null
                          ? DateFormat("dd MMM yyy").format(selectedDate!)
                          : DateFormat("dd MMM yyy").format(args.eventDate),
                      style: theme.textTheme.titleMedium?.copyWith(
                          color: MyColors.primary, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                "Location",
                style: theme.textTheme.titleMedium?.copyWith(),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    side: const BorderSide(color: MyColors.primary)),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: MyColors.primary,
                          borderRadius: BorderRadius.circular(8.0)),
                      child: const Icon(
                        Icons.my_location_outlined,
                        color: MyColors.white,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Choose Event Location",
                      style: theme.textTheme.titleMedium?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: MyColors.primary),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: MyColors.primary,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60),
              ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      if (selectedDate != null) {
                        var data = EventDataModel(
                          eventID: args.eventID, // يجب تمرير eventID الموجود مسبقًا
                          eventTitle: titleController.text.isNotEmpty
                              ? titleController.text
                              : args.eventTitle,
                          eventDescription: descriptionController.text.isNotEmpty
                              ? descriptionController.text
                              : args.eventDescription,
                          eventCategory: eventCategories[selectedTab].eventCategoryName,
                          eventImage: eventCategories[selectedTab].eventCategoryImg,
                          eventDate: selectedDate ?? args.eventDate,
                        );

                        EasyLoading.show(status: "Updating...");

                        FirebaseFirestoreService.updateEvent(data).then((value) {
                          EasyLoading.dismiss();
                          if (value) {
                            navigatorKey.currentState!.pop();
                            SnackBarServices.showSuccessMessage("Event Updated Successfully");
                          } else {
                            SnackBarServices.showErrorMessage("Failed to update event. Try again!");
                          }
                        });
                      } else {
                        SnackBarServices.showErrorMessage("Please select an event date");
                      }
                    }
                  },

                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 12),
                      elevation: 0,
                      backgroundColor: MyColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      side: const BorderSide(color: MyColors.primary)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Update Event",
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: MyColors.white,
                        ),
                      ),
                    ],
                  )),
            ],
          ).setHorizontalPadding(context, 0.04),
        ),
      ),
    );
  }

  void selectEventDate(BuildContext context) async {
    DateTime? newDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365),
      ),
    );

    if (newDate != null) {
      setState(() {
        selectedDate = newDate;
      });
      print(selectedDate);
    }
  }

  void selectEventTime(BuildContext context) async {
    TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (newTime != null) {
      setState(() {
        selectedTime = newTime;
      });
      print(selectedTime);
    }
  }
}
