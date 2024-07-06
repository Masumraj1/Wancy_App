import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:get/get.dart';
import 'package:track_booking/utils/app_colors/app_colors.dart';
import 'package:track_booking/utils/app_strings/app_strings.dart';
import 'package:track_booking/view/screen/user_screen/authentication_screens/authentication_controller/authentication_controller.dart';
import 'package:track_booking/view/widgets/custom_text/custom_text.dart';

import 'inner_widgets/bank_info.dart';
import 'inner_widgets/primary_info_screen.dart';
import 'inner_widgets/track_info_screen.dart';

class DriverSignUp extends StatelessWidget {
  DriverSignUp({super.key});

  final AuthenticationController authenticationController =
      Get.find<AuthenticationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///====================Set your profile appbar===============
      appBar: AppBar(
        backgroundColor: AppColors.appBarBackground,
        title: CustomText(
          text: AppStrings.setYourProfile,
          fontWeight: FontWeight.w500,
          fontSize: 20.sp,
          color: Colors.white,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => EasyStepper(
                activeStep: authenticationController.currentStep.value,
                stepShape: StepShape.circle,
                stepBorderRadius: 15.r,
                borderThickness: 2,
                stepRadius: 28.r,
                activeStepBorderColor: AppColors.appBarBackground,
                activeStepBackgroundColor: AppColors.appBarBackground,
                finishedStepBackgroundColor: Colors.green,
                finishedStepBorderColor: Colors.green,
                unreachedStepBackgroundColor: Colors.grey,
                unreachedStepBorderColor: Colors.grey,
                steps: const [
                  EasyStep(
                    icon: Icon(Icons.person, color: Colors.white),
                    title: 'Primary Info',
                  ),
                  EasyStep(
                    icon: Icon(Icons.local_shipping, color: Colors.white),
                    title: 'Truck Info',
                  ),
                  EasyStep(
                    icon: Icon(Icons.account_balance, color: Colors.white),
                    title: 'Bank Info',
                  ),
                ],
                onStepReached: (index) {
                  authenticationController.updateStep(index);
                },
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: Obx(() {
                switch (authenticationController.currentStep.value) {
                  case 0:
                    return PrimaryInfoForm();
                  case 1:
                    return TruckInfoForm();
                  case 2:
                    return BankInfoForm();
                  default:
                    return PrimaryInfoForm();
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
