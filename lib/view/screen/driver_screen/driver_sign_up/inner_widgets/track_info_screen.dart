import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:track_booking/utils/app_colors/app_colors.dart';
import 'package:track_booking/utils/app_icons/app_icons.dart';
import 'package:track_booking/utils/app_images/app_images.dart';
import 'package:track_booking/utils/app_strings/app_strings.dart';
import 'package:track_booking/view/screen/user_screen/authentication_screens/authentication_controller/authentication_controller.dart';
import 'package:track_booking/view/widgets/custom_button/custom_button.dart';
import 'package:track_booking/view/widgets/custom_image/custom_image.dart';
import 'package:track_booking/view/widgets/custom_text/custom_text.dart';
import 'package:track_booking/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:track_booking/view/widgets/custom_tittle_and_checkbox/custom_tittle_and_checkbox.dart';

class TruckInfoForm extends StatelessWidget {
  TruckInfoForm({super.key});

  final AuthenticationController authenticationController =
  Get.find<AuthenticationController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///====================Truck info==============
            CustomText(
              text: AppStrings.truckInfo,
              fontSize: 17.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              bottom: 10.h,
            ),
            ///======================Driving licence Number==============
            _buildTextFieldSection(
              title: AppStrings.drivingLicenceNumber,
              controller: TextEditingController(),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 15.h),
            ///======================Driving Expire date==============
            _buildCustomEditProfileSection(
              title: AppStrings.drivingLicenceExpireDate,
              controller: TextEditingController(),
            ),
            ///==================Licence Image==============
            _buildImageSection(
              title: AppStrings.licenceImage,
              icons: [
                AppIcons.gallery,
                AppImages.galleryBack,
              ],
            ),
            SizedBox(height: 15.h),
            ///=====================Truck Registation Number========
            _buildCustomEditProfileSection(
              title: AppStrings.truckRegistrationNumber,
              controller: TextEditingController(),
            ),
            ///==================Registation ducument image =============
            _buildImageSection(
              title: AppStrings.registrationDocumentImage,
              icons: [AppIcons.gallery],
            ),
            SizedBox(height: 10.h),
            ///======================Truck Image==============
            _buildImageSection(
              title: AppStrings.truckImage,
              icons: [AppIcons.gallery],
            ),
            SizedBox(height: 10.h),
            ///====================Truck Size=============
            _buildCustomEditProfileSection(
              title: AppStrings.truckSize,
              controller: TextEditingController(),
            ),
            ///=================Capacity=============
            _buildCustomEditProfileSection(
              title: AppStrings.cargoCapacity,
              controller: TextEditingController(),
            ),
            ///=====================What kind of ==============
            CustomText(
              textAlign: TextAlign.start,
              color: AppColors.black,
              text: AppStrings.whatKindOf,
              fontWeight: FontWeight.w400,
              fontSize: 16.w,
              bottom: 8,
              maxLines: 3,
            ),
            _buildCheckboxSection(),
            ///================Set Your Price==========
            CustomText(
              textAlign: TextAlign.start,
              color: AppColors.black,
              text: AppStrings.setYourPrice,
              fontWeight: FontWeight.w400,
              fontSize: 16.w,
              bottom: 8,
            ),
            _buildPriceSection(),
            SizedBox(height: 15.h),
            ///===================Next Button===========
            CustomButton(
              onTap: () {
                authenticationController.updateStep(2);
              },
              title: AppStrings.next,
              fillColor: AppColors.appBarBackground,
            ),
          ],
        ),
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

  Widget _buildCustomEditProfileSection({
    required String title,
    required TextEditingController controller,
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
          isPassword: false,
          textEditingController: controller,
          inputTextStyle: const TextStyle(color: AppColors.black),
          fillColor: AppColors.selectNavbarColor,
          fieldBorderColor: AppColors.borderColor,
          keyboardType: TextInputType.text,
        ),
        SizedBox(height: 15.h),
      ],
    );
  }

  Widget _buildImageSection({
    required String title,
    required List<String> icons,
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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: icons
                .map((icon) => Padding(
              padding: EdgeInsets.only(right: 18.w),
              child: CustomImage(
                imageSrc: icon,
                imageType: icon == AppIcons.gallery
                    ? ImageType.svg
                    : ImageType.png,
              ),
            ))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildCheckboxSection() {
    return Column(
      children: const [
        CustomTittleAndCheckbox(title: AppStrings.furniture),
        CustomTittleAndCheckbox(title: AppStrings.changeOfResidence),
        CustomTittleAndCheckbox(title: AppStrings.foodProducts),
        CustomTittleAndCheckbox(title: AppStrings.chemical),
      ],
    );
  }

  Widget _buildPriceSection() {
    return Column(
      children: [
        Row(
          children: [
            CustomText(
              textAlign: TextAlign.start,
              color: AppColors.black,
              text: 'Km :',
              fontWeight: FontWeight.w400,
              fontSize: 16.w,
              bottom: 8,
            ),
            const Spacer(),
            CustomText(
              textAlign: TextAlign.start,
              color: AppColors.black,
              text: 'Price :',
              fontWeight: FontWeight.w400,
              fontSize: 16.w,
              bottom: 8,
            ),
          ],
        ),
        Row(
          children: [
            const Expanded(
              child: CustomTextField(
                fillColor: AppColors.selectNavbarColor,
              ),
            ),
            SizedBox(width: 15.w),
            const Expanded(
              child: CustomTextField(
                fillColor: AppColors.selectNavbarColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
