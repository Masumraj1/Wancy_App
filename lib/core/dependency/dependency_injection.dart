
import 'package:get/get.dart';
import 'package:track_booking/view/screen/driver_screen/driver_home_screen/driver_home_controller/driver_home_controller.dart';
import 'package:track_booking/view/screen/user_screen/authentication_screens/authentication_controller/authentication_controller.dart';
import 'package:track_booking/view/screen/user_screen/home_screen/home_controller/home_controller.dart';
import 'package:track_booking/view/screen/user_screen/message_screen/MessgaeController/message_controller.dart';
import 'package:track_booking/view/screen/user_screen/profile_screen/profile_controller/profile_controller.dart';




class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    ///==========================User section==================
   Get.lazyPut(() => ProfileController(), fenix: true);
   Get.lazyPut(() => AuthenticationController(), fenix: true);
   Get.lazyPut(() => MessageController(), fenix: true);
   Get.lazyPut(() => HomeController(), fenix: true);


   ///============================Driver section==============
   Get.lazyPut(() => DriverHomeController(), fenix: true);



  }
}
