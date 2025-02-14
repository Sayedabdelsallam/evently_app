import 'package:evently_app/core/extensions/dimensions.dart';
import 'package:evently_app/core/extensions/padding_ext.dart';
import 'package:evently_app/core/utils/colors.dart';
import 'package:evently_app/core/widgets/custom_button.dart';
import 'package:evently_app/core/widgets/custom_tap_bar_item.dart';
import 'package:evently_app/core/widgets/custom_text_form.dart';
import 'package:flutter/material.dart';

class CreateEventScreen extends StatefulWidget {

  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  final titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: ()=>Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              color: MyColors.primary,
              size: size.height * 0.03,
            ),
        ),
        title: Text(
          'Create Event',
          style: TextStyle(
            color: MyColors.primary,
            fontSize: size.height * 0.025,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: 6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'assets/images/gamingCard.png',
                        height: size.height * 0.25,
                        width: 1.width,
                        fit: BoxFit.fill,
                      ),
                    ),
                    16.spaceVertical,
                    /// => Tab Bar
                    SizedBox(
                      height: 0.06.height,
                      width: 1.width,
                      child: TabBar(
                        onTap: (index){},
                        isScrollable: true,
                        tabAlignment: TabAlignment.start,
                        indicatorColor: Colors.transparent,
                        dividerColor: Colors.transparent,
                        tabs: [
                          CustomTapBarItem(
                            isSelected: false,
                            isHomeTab: false,
                            size: size,
                            title: 'All',
                            icon: Icons.directions_outlined,
                          ),
                          CustomTapBarItem(
                            isSelected: true,
                            isHomeTab: false,
                            size: size,
                            title: 'All',
                            icon: Icons.directions_outlined,
                          ),
                          CustomTapBarItem(
                            isSelected: false,
                            isHomeTab: false,
                            size: size,
                            title: 'All',
                            icon: Icons.directions_outlined,
                          ),
                          CustomTapBarItem(
                            isSelected: false,
                            isHomeTab: false,
                            size: size,
                            title: 'All',
                            icon: Icons.directions_outlined,
                          ),
                          CustomTapBarItem(
                            isSelected: false,
                            isHomeTab: false,
                            size: size,
                            title: 'All',
                            icon: Icons.directions_outlined,
                          ),
                          CustomTapBarItem(
                            isSelected: false,
                            isHomeTab: false,
                            size: size,
                            title: 'All',
                            icon: Icons.directions_outlined,
                          ),
                
                        ],
                      ),
                    ),
                    16.spaceVertical,
                    CustomTextField(
                        controller: titleController  ,
                        label: 'Event Title',
                        keyboardType: TextInputType.text,
                        prefixIcon: Icon(Icons.edit_note),
                      minLines: 2,
                    ),
                    16.spaceVertical,
                    CustomTextField(
                        controller: titleController  ,
                        label: 'Event Description',
                        keyboardType: TextInputType.text,
                      minLines: 5,
                    ),
                    16.spaceVertical,
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month,
                          size: size.height * 0.03,
                        ),
                        8.spaceHorizontal,
                        Text(
                          'Event Date',
                          style: TextStyle(
                            fontSize: size.height * 0.02,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                        TextButton(
                            onPressed: (){},
                            child: Text(
                              'Choose Date',
                              style: TextStyle(
                                fontSize: size.height * 0.02,
                                fontWeight: FontWeight.w500,
                                color: MyColors.primary,
                              ),
                            ),
                        ),
                      ],
                    ),
                    8.spaceVertical,
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: size.height * 0.03,
                        ),
                        8.spaceHorizontal,
                        Text(
                          'Event Time',
                          style: TextStyle(
                            fontSize: size.height * 0.02,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                        TextButton(
                            onPressed: (){},
                            child: Text(
                              'Choose Time',
                              style: TextStyle(
                                fontSize: size.height * 0.02,
                                fontWeight: FontWeight.w500,
                                color: MyColors.primary,
                              ),
                            ),
                        ),
                      ],
                    ),
                    16.spaceVertical,
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: MyColors.primary),
                      ),
                      child: Row(
                        children: [
                          FloatingActionButton(
                              onPressed: (){},
                            elevation: 0,
                              backgroundColor: MyColors.primary,
                              child: Icon(
                                Icons.my_location_rounded,
                                color: MyColors.white,
                              ),
                          ),
                          8.spaceHorizontal,
                          Text(
                            'Choose Event Location',
                            style: TextStyle(
                              fontSize: size.height * 0.02,
                              fontWeight: FontWeight.w500,
                              color: MyColors.primary,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: size.height * 0.022,
                            color: MyColors.primary,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            16.spaceVertical,
            SafeArea(
              child: SizedBox(
                height: 0.06.height,
                child: CustomButton(
                  borderRadius: 16,
                  title: 'Add Event',
                  onTab: (){},
                ),
              ),
            ).setVerticalPadding(context, 0.02),
          ],
        ).setHorizontalPadding(context, 0.05),
      ),
    );
  }
}
