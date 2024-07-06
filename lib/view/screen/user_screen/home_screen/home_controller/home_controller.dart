import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController{
  ///========================Notification list===================
  final List<Map<String, String>> notifications = [
    {
      "title": "Payment Successful!",
      "sub": "You have made a payment",
    },
    {
      "title": "xmas greetings message",
      "sub": "Dr.Adit is available for your consultation.",
    },
    {
      "title": "New Post Published",
      "sub": "Toothache how and why?",
    },
  ];

  ///=================Customer care ===================
  Future<void> launchPhone(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  RxInt selectedIndex=0.obs;
  RxBool isTap = true.obs;

}