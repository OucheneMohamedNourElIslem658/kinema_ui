import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class ShowHideButtonController extends GetxController {
  late ScrollController scrollController;
  bool isScrollingUp = true;
  @override
  void onInit() {
    scrollController = ScrollController();
    scrollController.addListener(listenToScrollStatus);
    super.onInit();
  }

  void listenToScrollStatus(){
    if (scrollController.position.userScrollDirection != ScrollDirection.forward) {
      isScrollingUp = false;
    } else {
      isScrollingUp = true;
    }
    update();
  }
}