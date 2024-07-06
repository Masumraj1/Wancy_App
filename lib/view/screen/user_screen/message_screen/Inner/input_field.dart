import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:track_booking/utils/ToastMsg/toast_message.dart';
import 'package:track_booking/utils/app_colors/app_colors.dart';
import 'package:track_booking/view/screen/user_screen/message_screen/MessgaeController/message_controller.dart';
import 'package:track_booking/view/widgets/custom_text_field/custom_text_field.dart';



class MessageInputField extends StatelessWidget {
   MessageInputField({super.key});

 final  MessageController controller=Get.find<MessageController>();
  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets,
      duration: const Duration(milliseconds: 100),
      curve: Curves.decelerate,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [

            ///============================== Image Pick Design ============================

            //controller.isComment.value==true &&
            controller.imagePath.value.isNotEmpty?

            Container(
              margin: const EdgeInsets.only(bottom: 10),
              height: 120,
              width: 220,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.black),
                borderRadius: BorderRadius.circular(8.r),
                // image: DecorationImage(
                //     fit: BoxFit.cover,
                //     image: FileImage(
                //         File(controller.imagePath.value)))
              ),
              child: Row(
                children: [
                  SizedBox(
                      height: 100,
                      width: 150,
                      child: Image.file(
                          File(controller.imagePath.value))),
                  IconButton(
                      onPressed: () {
                        controller.imagePath.value ="";
                        controller.isComment.value=!controller.isComment.value;
                        controller.update();
                        controller.imagePath.refresh();
                      },
                      icon: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.white)),
                        child: const Icon(
                          Icons.remove,
                          color: AppColors.black,
                        ),
                      )),
                ],
              ),
            ):

            SizedBox(height: 1.h,),


            Row(
              children: [

                ///=============================== Gallery Button ==========================

                IconButton(
                  onPressed: (){
                    controller.selectImage();
                    controller.isComment.value=!controller.isComment.value;
                    controller.update();
                    controller.isComment.refresh();
                  print("This is commit value=   ${controller.isComment.value}");
                 },
                  icon: const Icon(
                    Icons.image_outlined,
                    size: 36,
                  ),
                ),
                //============================Text Input Field=====================

                Expanded(
                    child: SizedBox(
                      height: 50,
                      child: CustomTextField(
                        textInputAction: TextInputAction.done,
                        hintText: "Write your message",
                        fieldBorderColor: AppColors.selectNavbarColor,
                        fillColor: Colors.transparent,
                      ),
                    )),

                //=============================== Send Button ==========================

                GestureDetector(

                    onTap:(){
                      if(controller.sendController.value.text.isNotEmpty==true || controller.imagePath.value.isNotEmpty==true){
                        // controller.sendMessage();
                      }else{
                        toastMessage(message:"Please write something");
                      }
                    },

                  child: Container(
                    margin: EdgeInsets.only(left: 4.w),
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        color: AppColors.selectNavbarColor),
                    child: const Icon(
                      Icons.send_sharp,
                      color: AppColors.black,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}