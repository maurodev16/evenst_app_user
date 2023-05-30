import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../Controllers.dart/container_controller.dart';

GetBuilder<ContainerController> customBottomAppBarItem(
  BuildContext context, {
  required page,
  Text? title,
  required Icon icon,
  required Color color,
}) {
  return GetBuilder<ContainerController>(
    builder: (controller) => ZoomTapAnimation(
      onTap: () => controller.changePage(page),
      child: Get.width < 600
          ? Container(
              // Layout para telas menores que 600 pixels de largura (por exemplo, smartphones)
              color: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      icon,
                    ],
                  ),
                ],
              ),
            )
          : Get.width < 1200
              ? Container(
                  // Layout para telas entre 600 e 1200 pixels de largura (por exemplo, tablets)
                  color: Colors.transparent,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          icon,
                        ],
                      ),
                    ],
                  ),
                )
              : // Layout para telas maiores que 1200 pixels de largura (por exemplo, desktops),
              Container(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          icon,
                        ],
                      ),
                    ],
                  ),
                ),
    ),
  );
}
