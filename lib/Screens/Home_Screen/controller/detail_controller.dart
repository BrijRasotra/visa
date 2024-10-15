import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  RxInt isSelect = 0.obs;

  Rx<TextEditingController> questionController = TextEditingController().obs;
}
