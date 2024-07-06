import 'package:get/get.dart';
import 'package:track_booking/utils/app_strings/app_strings.dart';
import 'package:url_launcher/url_launcher.dart';

class DriverHomeController extends GetxController{

  ///===================Customer care method ==========
  Future<void> launchPhone(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }
  ///=================home select condition=========
  RxInt selectedIndex=0.obs;

  ///==================toggle button==============
  var isAllSelected = true.obs;

  void toggleSelection() {
    isAllSelected.value = !isAllSelected.value;
  }

  ///=======================List============
  final List<String> userList = [
    AppStrings.newRequest,
    AppStrings.history,
  ];
}