import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:track_booking/view/widgets/custom_text/custom_text.dart';

class CustomNameWidget extends StatelessWidget {
  final String label;
  final String value;

  const CustomNameWidget({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            text: label,
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
            color: Colors.black,
          ),
          CustomText(
            text: value,
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
