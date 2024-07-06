import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:track_booking/core/app_routes/app_routes.dart';
import 'package:track_booking/utils/app_colors/app_colors.dart';
import 'package:track_booking/utils/app_const/app_const.dart';
import 'package:track_booking/utils/app_strings/app_strings.dart';
import 'package:track_booking/view/screen/user_screen/home_screen/home_controller/home_controller.dart';
import 'package:track_booking/view/widgets/custom_netwrok_image/custom_network_image.dart';
import 'package:track_booking/view/widgets/custom_text/custom_text.dart';

class AddTripScreen extends StatelessWidget {
  AddTripScreen({super.key});

  final List<String> userList = [
    AppStrings.route,
    AppStrings.allDay,
  ];
  final HomeController homeController = Get.find<HomeController>();
  final List<RxBool> tappedContainers = List.generate(4, (_) => false.obs);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///==============================Add trip Appbar ============
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
          color: AppColors.white,
        ),
        backgroundColor: AppColors.appBarBackground,
        title: CustomText(
          text: AppStrings.addTrip,
          color: AppColors.white,
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///===================Map here=============
              CustomNetworkImage(
                imageUrl: AppConstants.map,
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
              ),
            ],
          ),
          Positioned.fill(
            top: MediaQuery.of(context).size.height / 3 - 25.h,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Obx(
                      () {
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ///=======================Two Tap button=============
                          Row(
                            children: List.generate(
                              userList.length,
                                  (index) => GestureDetector(
                                onTap: () {
                                  homeController.selectedIndex.value = index;
                                  // homeController.isTap.value = !homeController.isTap.value;
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(16),
                                  padding: EdgeInsets.symmetric(
                                    vertical: 8.h,
                                    horizontal: 16.w,
                                  ),
                                  decoration: BoxDecoration(
                                    color: homeController.selectedIndex.value == index
                                        ? AppColors.blueNormal
                                        : AppColors.whiteNormal,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: CustomText(
                                    textAlign: TextAlign.start,
                                    text: userList[index],
                                    color: homeController.selectedIndex.value == index
                                        ? AppColors.white
                                        : AppColors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ///=========================List of multiple===========
                          Column(
                            children: List.generate(4, (index) {
                              return GestureDetector(
                                onTap: () {
                                  tappedContainers[index].value = !tappedContainers[index].value;
                                },
                                child: Obx(() {
                                  return GestureDetector(
                                    onTap: (){
                                      Get.toNamed(AppRoutes.overviewScreen);
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.all(10),
                                      padding: const EdgeInsets.all(13.0),
                                      decoration: BoxDecoration(
                                        color: tappedContainers[index].value
                                            ? AppColors.blueLight
                                            : AppColors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: [
                                          CustomNetworkImage(
                                            borderRadius: BorderRadius.circular(10),
                                            imageUrl: AppConstants.truck,
                                            height: 50.h,
                                            width: 82.w,
                                          ),
                                          SizedBox(
                                            width: 16.w,
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              CustomText(
                                                text: '7 Fit 1 ton (Open)',
                                                color: AppColors.black,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16.sp,
                                                bottom: 12.h,
                                              ),
                                              CustomText(
                                                text: 'A small amount of pro...',
                                                color: AppColors.greenLight,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12.sp,
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          CustomText(
                                            text: '\$960',
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16.sp,
                                            bottom: 12.h,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                              );
                            }),
                          )
                          // Additional content here
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
