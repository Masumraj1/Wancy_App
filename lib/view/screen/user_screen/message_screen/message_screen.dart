import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:track_booking/utils/app_const/app_const.dart';
import 'package:track_booking/view/screen/user_screen/message_screen/MessgaeController/message_controller.dart';

import 'Inner/chat_bubble.dart';
import 'Inner/input_field.dart';
import 'Inner/message_app_bar.dart';

class MessageScreen extends StatelessWidget{
  MessageScreen({super.key});

  // final String image = Get.arguments[0];

  // final String name = Get.arguments[1];

  final MessageController inboxController = Get.find<MessageController>();

  @override
  Widget build(BuildContext context){
    return Scaffold(

      bottomNavigationBar:MessageInputField(),
      body: Column(children: [

        ///============================== App Bar ==============================

        MessageAppBar(
          img: AppConstants.userNtr,
          userName: "Tamim",
        ),

        ///============================== Chat Bubble ==============================

        const Expanded(child: ChatBubbleMessage()),

      ]),
    );
  }
}