import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:track_booking/core/app_routes/app_routes.dart';
import 'package:track_booking/utils/app_colors/app_colors.dart';
import 'package:track_booking/utils/app_images/app_images.dart';
import 'package:track_booking/view/widgets/custom_image/custom_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double progressValue = 0.0;

  @override
  void initState() {
    super.initState();
    startLoading();
  }

  void startLoading() {
    // Simulate loading progress
    Future.delayed(const Duration(milliseconds: 10), () {
      setState(() {
        progressValue += 0.01; // Increment progress
      });
      if (progressValue < 1.0) {
        startLoading(); // Continue incrementing progress
      } else {
        navigate(); // Navigate to the next screen
      }
    });
  }

  void navigate() {
    // Navigate to the next screen after a short delay to show the completed progress bar
    Future.delayed(const Duration(milliseconds: 400), () {
      Get.offAllNamed(AppRoutes.onBoardScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.drawerContainer,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CustomImage(
                imageSrc: AppImages.logo,
                imageType: ImageType.png,
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: LinearProgressIndicator(
                  value: progressValue,
                  minHeight: 10,
                  backgroundColor: Colors.grey[300],
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
