import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:track_booking/utils/app_colors/app_colors.dart';
import 'package:track_booking/view/widgets/custom_text/custom_text.dart';

class CustomTittleAndCheckbox extends StatefulWidget {
  final String title;


  const CustomTittleAndCheckbox({
    super.key,
    required this.title,

  });

  @override
  _CustomTittleAndCheckboxState createState() => _CustomTittleAndCheckboxState();
}

class _CustomTittleAndCheckboxState extends State<CustomTittleAndCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: widget.title,
                fontSize: 16.sp,
                color: AppColors.black,
                fontWeight: FontWeight.w400,
              ),
              Checkbox(
                checkColor: AppColors.appBarBackground,
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value ?? false;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
