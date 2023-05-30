import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContainerController extends GetxController {
  late PageController pageController;

  final RxInt currentIndex = 0.obs;
  void changePage(int index) {
    currentIndex.value = index;
    pageController.jumpToPage(index);
    update();
  }

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
