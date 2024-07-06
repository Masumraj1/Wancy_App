
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:track_booking/helper/shared_prefe/shared_prefe.dart';
import 'package:track_booking/utils/app_const/app_const.dart';

class AuthenticationController extends GetxController{
  ///=======================Remember me ========================
  RxBool isRemember = false.obs;
  toggleRemember() {
    isRemember.value = !isRemember.value;
    debugPrint("Remember me==============>>>>>>>>>$isRemember");
    refresh();
    SharePrefsHelper.setBool(AppConstants.isRememberMe, isRemember.value);
  }

  ///============================Image picker method================
  RxString image = "".obs;

  Rx<File> imageFile = File("").obs;
  selectImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? getImages =
    await picker.pickImage(source: ImageSource.gallery, imageQuality: 15);
    if (getImages != null) {
      imageFile.value = File(getImages.path);
      image.value = getImages.path;
    }
  }

///======================Driver sign up ================
  var currentStep = 0.obs;

  void updateStep(int step) {
    currentStep.value = step;
  }

  ///======================================controller====================
     TextEditingController emailController = TextEditingController();
     TextEditingController passwordController = TextEditingController();
     TextEditingController userNameController = TextEditingController();
     TextEditingController confirmController = TextEditingController();
     TextEditingController pinCodeController = TextEditingController();
}