import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:track_booking/utils/app_colors/app_colors.dart';
import 'package:track_booking/utils/app_icons/app_icons.dart';
import 'package:track_booking/view/screen/user_screen/home_screen/home_screen.dart';
import 'package:track_booking/view/screen/user_screen/message_screen/inbox_screen.dart';
import 'package:track_booking/view/screen/user_screen/profile_screen/profile_screen.dart';
import 'package:track_booking/view/screen/user_screen/trip_screen/trip_screen.dart';
import 'package:track_booking/view/widgets/custom_text/custom_text.dart';

class UserNavBar extends StatefulWidget {
  final int currentIndex;

  const UserNavBar({required this.currentIndex, super.key});

  @override
  State<UserNavBar> createState() => _UserNavBarState();
}

class _UserNavBarState extends State<UserNavBar> {
  late int bottomNavIndex;

  final List<String> unselectedIcon = [
    AppIcons.userHomeUnSelected,
    AppIcons.userTripUnselected,
    AppIcons.userMessageUnSelected,
    AppIcons.userProfileUnSelected,
  ];

  final List<String> selectedIcon = [
    AppIcons.userHomeSelected,
    AppIcons.userTripSelected,
    AppIcons.userMessageSelected,
    AppIcons.userProfileSelected,
  ];

  final List<String> userNavText = [
    'Home',
    'Trip',
    'Message',
    'Profile',
  ];

  @override
  void initState() {
    bottomNavIndex = widget.currentIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 66.h,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 7.h),
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          unselectedIcon.length,
          (index) => InkWell(
            onTap: () => onTap(index),
            child: Container(
              padding: EdgeInsets.symmetric(

                horizontal: 15.w,
              ),
              decoration: BoxDecoration(
                color: index == bottomNavIndex
                    ? AppColors.selectNavbarColor
                    : null,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    index == bottomNavIndex
                        ? selectedIcon[index]
                        : unselectedIcon[index],
                    height: 24.h,
                    width: 24.w,
                  ),
                  SizedBox(height: 4.h),
                  CustomText(
                    text: userNavText[index],
                    color: index == bottomNavIndex
                        ? AppColors.black
                        : Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onTap(int index) {
    if (index != bottomNavIndex) {
      switch (index) {
        case 0:
          Get.offAll(() => HomeScreen());
          break;
        case 1:
          Get.offAll(() =>  TripScreen());
          break;
        case 2:
          Get.offAll(() => const InboxScreen());
          break;
        case 3:
          Get.offAll(() => ProfileScreen());
          break;
      }
    }
  }
}
