import 'package:events_app_user/Pages/Home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../Constants/const_colors.dart';
import '../../Controllers.dart/container_controller.dart';
import '../Favorite/favorite_page.dart';
import '../Profile/profile_page.dart';
import 'bottom_items.dart';

class ContainerPage extends GetView<ContainerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: preto_forte,
        title: Text('LOGO'),
        centerTitle: true,
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
          HomePage(),
          FavoritePage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: GetBuilder<ContainerController>(
        builder: (_) {
          return BottomAppBar(
            height: 50,
            color: preto_forte,
            elevation: 0,
            notchMargin: 10,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customBottomAppBarItem(
                    context,
                    page: 0,
                    icon: Icon(
                      IconlyLight.home,
                      color: controller.currentIndex.value == 0
                          ? cinza_w500
                          : branco,
                      size: 20,
                    ),
                    color: controller.currentIndex.value == 0
                        ? cinza_w500
                        : branco,
                  ),
                  customBottomAppBarItem(
                    context,
                    page: 1,
                    title: Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: controller.currentIndex.value == 1
                            ? cinza_w500
                            : branco,
                      ),
                    ),
                    icon: Icon(
                      IconlyLight.profile,
                      color: controller.currentIndex.value == 1
                          ? cinza_w500
                          : branco,
                      size: 20,
                    ),
                    color: controller.currentIndex.value == 1
                        ? cinza_w500
                        : branco,
                  ),
                  customBottomAppBarItem(
                    context,
                    page: 2,
                    title: Text(
                      "Favorite",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: controller.currentIndex.value == 2
                            ? cinza_w500
                            : branco,
                      ),
                    ),
                    icon: Icon(
                      IconlyLight.heart,
                      color: controller.currentIndex.value == 2
                          ? cinza_w500
                          : branco,
                      size: 20,
                    ),
                    color: controller.currentIndex.value == 2
                        ? cinza_w500
                        : branco,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
