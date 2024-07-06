import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:track_booking/core/app_routes/app_routes.dart';
import 'package:track_booking/utils/app_colors/app_colors.dart';
import 'package:track_booking/utils/app_strings/app_strings.dart';
import 'package:track_booking/view/screen/user_screen/authentication_screens/authentication_controller/authentication_controller.dart';
import 'package:track_booking/view/widgets/custom_button/custom_button.dart';
import 'package:track_booking/view/widgets/custom_text/custom_text.dart';
import 'package:track_booking/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:track_booking/view/widgets/custom_widgets/custom_widgets.dart';

class BankInfoForm extends StatelessWidget {
  BankInfoForm({super.key});

  final CustomWidgets customWidgets = CustomWidgets();
  final AuthenticationController authenticationController =
      Get.find<AuthenticationController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
         () {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///================Bank info==============
              CustomText(
                text: '${AppStrings.bankInfo}:',
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                bottom: 10.h,
              ),

              ///===================Bank Account number===============
              _buildTextFieldSection(
                title: AppStrings.bankAccountNumber,
                controller: TextEditingController(),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(
                height: 10.h,
              ),
              ///===================Bank  name===============
              customWidgets.customEditProfile(
                  title: AppStrings.bankName, controller: TextEditingController()),

              ///===================Routing Number  ===============
              _buildTextFieldSection(
                title: AppStrings.routingNumber,
                controller: TextEditingController(),
                keyboardType: TextInputType.phone,
              ),

              ///===================Account Holder name  ===============
              customWidgets.customEditProfile(
                  title: AppStrings.accountHolderName,
                  controller: TextEditingController()),
              ///==============Checkbox============
              Row(
                children: [
                  Checkbox(
                    value: authenticationController.isRemember.value,
                    checkColor: AppColors.white,
                    activeColor: AppColors.appBarBackground,
                    onChanged: (value) {
                      authenticationController.toggleRemember();
                    },
                  ),
                  Flexible(
                    child: CustomText(
                      textAlign: TextAlign.start,
                      color: Colors.black,
                      maxLines: 2,
                      text: AppStrings.byContinue,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),

              ///====================Lets go button=============
              CustomButton(
                onTap: () {
                  Get.toNamed(AppRoutes.driverHomeScreen);
                },
                title: AppStrings.letsGo,
                fillColor: AppColors.appBarBackground,
              )
            ],
          );
        }
      ),
    );
  }




  Widget _buildTextFieldSection({
    required String title,
    required TextEditingController controller,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          color: AppColors.black,
          text: title,
          fontWeight: FontWeight.w400,
          fontSize: 16.w,
          bottom: 8,
        ),
        CustomTextField(
          textEditingController: controller,
          inputTextStyle: const TextStyle(color: AppColors.black),
          fillColor: AppColors.selectNavbarColor,
          fieldBorderColor: AppColors.borderColor,
          keyboardType: TextInputType.phone,
        ),
      ],
    );
  }
}
