import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:track_booking/core/app_routes/app_routes.dart';
import 'package:track_booking/utils/app_colors/app_colors.dart';
import 'package:track_booking/utils/app_strings/app_strings.dart';
import 'package:track_booking/view/widgets/custom_recent_search/custom_recent_search.dart';
import 'package:track_booking/view/widgets/custom_search_card/custom_search_card.dart';
import 'package:track_booking/view/widgets/custom_text/custom_text.dart';
 // Import the custom recent search item widget

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///===========================Search Appbar==============
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
          text: AppStrings.search,
          color: AppColors.white,
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///====================Custom Search card==========
              const CustomSearchCard(),
              ///==================recent text =============
              CustomText(
                top: 16.h,
                text: AppStrings.recent,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.normalBlack,
                bottom: 16.h,
              ),
              ///======================custom Recent searches========
              GestureDetector(
                  onTap: (){
                    Get.toNamed(AppRoutes.addTripScreen);
                  },
                  child: _buildRecentSearches()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecentSearches() {
    final recentSearches = [
      {
        'title': 'Forum Fiza Mall, Kormangala',
        'subtitle': '13th main Road, Bangalore West',
      },
      {
        'title': 'Some Other Place',
        'subtitle': 'Another Road, Some City',
      },  {
        'title': 'Some Other Place',
        'subtitle': 'Another Road, Some City',
      },  {
        'title': 'Some Other Place',
        'subtitle': 'Another Road, Some City',
      },
      // Add more recent search items here
    ];

    return Column(
      children: recentSearches.map((search) {
        return CustomRecentSearch(
          title: search['title']!,
          subtitle: search['subtitle']!,
        );
      }).toList(),
    );
  }
}
