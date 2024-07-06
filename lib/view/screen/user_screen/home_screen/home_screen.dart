// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:track_booking/core/app_routes/app_routes.dart';
// import 'package:track_booking/utils/app_colors/app_colors.dart';
// import 'package:track_booking/utils/app_const/app_const.dart';
// import 'package:track_booking/utils/app_images/app_images.dart';
// import 'package:track_booking/utils/app_strings/app_strings.dart';
// import 'package:track_booking/view/widgets/custom_image/custom_image.dart';
// import 'package:track_booking/view/widgets/custom_location_tile/custom_location_tile.dart';
// import 'package:track_booking/view/widgets/custom_netwrok_image/custom_network_image.dart';
// import 'package:track_booking/view/widgets/custom_text_field/custom_text_field.dart';
// import 'package:track_booking/view/widgets/user_nav_bar/user_nav_bar.dart';
// import 'package:track_booking/view/widgets/custom_text/custom_text.dart'; // Assuming this is where CustomText is located
// import 'inner_widgets/home_appbar.dart';
// import 'inner_widgets/side_drawer.dart';
//
// class HomeScreen extends StatelessWidget {
//   HomeScreen({super.key});
//
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scaffoldKey,
//
//       ///===================================Side Drawer=============================
//       drawer: SideDrawer(),
//       bottomNavigationBar: const UserNavBar(currentIndex: 0),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ///====================== Home AppBar and banner =======================
//           HomeAppBar(scaffoldKey: scaffoldKey),
//
//           ///==========================Map Image===============
//           Expanded(
//             child
//                 : SingleChildScrollView(
//                   child: Stack(
//                                 children: [
//                   CustomNetworkImage(
//                     imageUrl: AppConstants.map,
//                     height: MediaQuery.of(context).size.height/1,
//                     width: MediaQuery.of(context).size.width,
//                   ),
//                   Positioned.fill(
//                     top: MediaQuery.of(context).size.height / 2 - 50.h,
//                     left: 0,
//                     right: 0,
//                     child: Container(
//                       padding: EdgeInsets.symmetric(horizontal: 20.h),
//                       decoration: const BoxDecoration(
//                         color: AppColors.white,
//                         borderRadius: BorderRadius.only(
//                           topRight: Radius.circular(20),
//                           topLeft: Radius.circular(20),
//                         ),
//                       ),
//                       child: SingleChildScrollView(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             SizedBox(height: 31.h),
//                             const Center(
//                               ///===================Banner==============
//                               child: CustomImage(
//                                 imageSrc: AppImages.banner,
//                                 imageType: ImageType.png,
//                               ),
//                             ),

//                             // Add more widgets here if needed
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                                 ],
//                               ),
//                 ),
//           ),
//           // Add more widgets here as needed
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:track_booking/core/app_routes/app_routes.dart';
import 'package:track_booking/utils/app_colors/app_colors.dart';
import 'package:track_booking/utils/app_const/app_const.dart';
import 'package:track_booking/utils/app_images/app_images.dart';
import 'package:track_booking/utils/app_strings/app_strings.dart';
import 'package:track_booking/view/widgets/custom_image/custom_image.dart';
import 'package:track_booking/view/widgets/custom_location_tile/custom_location_tile.dart';
import 'package:track_booking/view/widgets/custom_netwrok_image/custom_network_image.dart';
import 'package:track_booking/view/widgets/custom_text/custom_text.dart';
import 'package:track_booking/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:track_booking/view/widgets/user_nav_bar/user_nav_bar.dart';

import 'inner_widgets/home_appbar.dart';
import 'inner_widgets/side_drawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,

      ///===================================Side Drawer=============================
      drawer: SideDrawer(),
      bottomNavigationBar: const UserNavBar(currentIndex: 0),

      ///==============================Add trip Appbar ============

      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeAppBar(scaffoldKey: scaffoldKey),

              ///===================Map here=============
              CustomNetworkImage(
                imageUrl: AppConstants.map,
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
              ),
            ],
          ),
          Positioned.fill(
            top: MediaQuery.of(context).size.height / 2 - 50.h,
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
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///=======================Banner Image=============
                        const CustomImage(
                          imageSrc: AppImages.banner,
                          imageType: ImageType.png,
                        ),

                        ///=========================What to Today===========
                        CustomText(
                          top: 20,
                          text: AppStrings.whereToToday,
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          bottom: 10,
                        ),

                        ///====================Search Field============
                        CustomTextField(
                          onTap: () {
                            Get.toNamed(AppRoutes.searchScreen);
                          },
                          readOnly: true,
                          fillColor: AppColors.blueNormal,
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          hintStyle: const TextStyle(color: Colors.white),
                          hintText: AppStrings.searchYourLocationHere,
                        ),

                        CustomText(
                          top: 20,
                          text: AppStrings.setLocation,
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          bottom: 10,
                        ),
                         CustomLocationTile(
                          onTap: (){
                            Get.toNamed(AppRoutes.searchScreen);
                          },
                            icon: Icons.arrow_upward, text: 'Pickup Location'),
                        SizedBox(
                          height: 10.h,
                        ),
                         CustomLocationTile(
                            onTap: (){
                              Get.toNamed(AppRoutes.searchScreen);
                            },
                            icon: Icons.arrow_downward, text: 'Where to go?'),
                      ],
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
