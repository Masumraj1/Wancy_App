import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:track_booking/utils/app_const/app_const.dart';
import 'package:track_booking/view/screen/driver_screen/driver_message_screen/Inner/driver_chat_bubble.dart';
import 'package:track_booking/view/screen/driver_screen/driver_message_screen/Inner/driver_input_field.dart';
import 'package:track_booking/view/screen/driver_screen/driver_message_screen/Inner/driver_message_appbar.dart';
import 'package:track_booking/view/screen/user_screen/message_screen/MessgaeController/message_controller.dart';


class DriverMessageScreen extends StatelessWidget{
  DriverMessageScreen({super.key});

  // final String image = Get.arguments[0];

  // final String name = Get.arguments[1];

  final MessageController inboxController = Get.find<MessageController>();

  @override
  Widget build(BuildContext context){
    return Scaffold(

      bottomNavigationBar:DriverInputField(),
      body: Column(children: [

        ///============================== App Bar ==============================

        DriverMessageAppbar(
          img: AppConstants.userNtr,
          userName: "Tamim",
        ),

        ///============================== Chat Bubble ==============================

        const Expanded(child: DriverChatBubble()),

      ]),
    );
  }
}