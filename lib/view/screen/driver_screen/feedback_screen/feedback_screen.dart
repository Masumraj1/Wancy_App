import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:track_booking/utils/app_colors/app_colors.dart';
import 'package:track_booking/utils/app_strings/app_strings.dart';
import 'package:track_booking/view/widgets/custom_button/custom_button.dart';
import 'package:track_booking/view/widgets/custom_text/custom_text.dart';
import 'package:track_booking/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:track_booking/view/widgets/custom_widgets/custom_widgets.dart';

class FeedbackScreen extends StatelessWidget {
  FeedbackScreen({super.key});

  final CustomWidgets customWidgets = CustomWidgets();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      ///====================Feedback appbar=================
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
          color: AppColors.white,
        ),
        backgroundColor: AppColors.appBarBackground,
        title: CustomText(
          text: AppStrings.feedBack,
          fontWeight: FontWeight.w500,
          fontSize: 20.sp,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///=====================name====================
            customWidgets.customEditProfile(
                title: AppStrings.name, controller: TextEditingController()),

            ///======================Description==============
            CustomText(
              color: AppColors.black,
              text: AppStrings.description,
              fontWeight: FontWeight.w400,
              fontSize: 16.w,
              bottom: 8,
            ),
            CustomTextField(
              maxLines: 5,
              textEditingController: TextEditingController(),
              inputTextStyle: const TextStyle(color: AppColors.white),
              fillColor: AppColors.selectNavbarColor,
              fieldBorderColor: AppColors.borderColor,
              keyboardType: TextInputType.name,
            ),
            Expanded(

              child: Row(
                children: [
                  const Spacer(),
                  CustomButton(
                    width:99.w,
                    onTap: () {
                      Get.back();
                    },
                    title: AppStrings.cancel,
                    fillColor: AppColors.buttonColor,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  CustomButton(
                    width: 99.w,
                    onTap: () {
                      Get.back();
                    },
                    title: AppStrings.submit,
                    fillColor: AppColors.appBarBackground,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
