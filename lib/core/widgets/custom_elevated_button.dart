import 'package:flutter/material.dart';
import '../theme/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.title,
     this.liftIcon,
     this.rightIcon,
    required this.onTab,
  });
  final Function() onTab;
 final String title;
 final IconData? liftIcon;
 final IconData? rightIcon ;



  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var size = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: onTab,
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
            child:  Icon(
              color: MyColors.white,
              liftIcon,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: MyColors.primary),
          ),
          const Spacer(),
           Icon(
            rightIcon,
            color: MyColors.primary,
          ),
        ],
      ),
    );
  }
}
