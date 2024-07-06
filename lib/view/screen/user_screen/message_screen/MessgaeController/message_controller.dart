import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MessageController extends GetxController{
  RxBool isComment=false.obs;
  RxBool isChat = true.obs;
  RxDouble dragabbleHorizontal = 20.0.obs;
  RxDouble dragabbleVerticel = 100.0.obs;
  ScrollController scrollController = ScrollController();
  Rx<TextEditingController> sendController = TextEditingController().obs;
  List<Map<String, dynamic>> inboxChat = [
    {"sender": "0", "message": "Hii, hello", "messageType": "text"},
    {
      "sender": "0",
      "message":
      "We will meet soon  sorry  babe. i promise upcoming sun we will meet for sure. See you again. bye bye",
      "messageType": "text"
    },
    {"sender": "1", "message": "okk", "messageType": "text"},
    {"sender": "0", "message": "Iam Fine, hello", "messageType": "text"},
    {"sender": "1", "message": "hii", "messageType": "text"},
    {"sender": "1", "message": "Bye", "messageType": "text"},
  ];



  RxList selectedMembers = [].obs;




  ///========================== Pick Image ========================
  Rx<File> imageFile = File("").obs;
  RxString imagePath = "".obs;
  selectImage()async{
    final ImagePicker picker = ImagePicker();
    final XFile? getImages =
    await picker.pickImage(source: ImageSource.gallery, imageQuality: 15);
    refresh();
    if (getImages != null) {
      imageFile.value = File(getImages.path);
      imagePath.value = getImages.path;
      update();
    }
  }


}