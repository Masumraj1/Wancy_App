import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:track_booking/utils/app_colors/app_colors.dart';
import 'package:track_booking/utils/app_icons/app_icons.dart';
import 'package:track_booking/view/screen/driver_screen/driver_home_screen/driver_home_screen.dart';
import 'package:track_booking/view/screen/driver_screen/driver_message_screen/driver_inbox_screen.dart';
import 'package:track_booking/view/screen/driver_screen/driver_profile/driver_profile_screen.dart';
import 'package:track_booking/view/widgets/custom_text/custom_text.dart';

class DriverNavBar extends StatefulWidget {
  final int currentIndex;

  const DriverNavBar({required this.currentIndex, super.key});

  @override
  State<DriverNavBar> createState() => _DriverNavBarState();
}

class _DriverNavBarState extends State<DriverNavBar> {
  late int bottomNavIndex;

  final List<String> unselectedIcon = [
    AppIcons.userHomeUnSelected,
    AppIcons.userMessageUnSelected,
    AppIcons.userProfileUnSelected,
  ];

  final List<String> selectedIcon = [
    AppIcons.userHomeSelected,
    AppIcons.userMessageSelected,
    AppIcons.userProfileSelected,
  ];

  final List<String> navText = [
    'Home',
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          unselectedIcon.length,
              (index) => Expanded(
            child: InkWell(
              onTap: () => onTap(index),
              child: Container(
                decoration: BoxDecoration(
                  color: index == bottomNavIndex
                      ? AppColors.selectNavbarColor
                      : Colors.transparent,
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
                      text: navText[index],
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
      ),
    );
  }

  void onTap(int index) {
    if (index != bottomNavIndex) {
      setState(() {
        bottomNavIndex = index;
      });
      switch (index) {
        case 0:
          Get.offAll(() => DriverHomeScreen());
          break;
        case 1:
          Get.to(() => const DriverInboxScreen());
          break;
        case 2:
          Get.to(() =>  DriverProfileScreen());
          break;
      }
    }
  }
}
