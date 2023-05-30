import 'package:events_app_user/Controllers.dart/home_controller.dart';
import 'package:events_app_user/Models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';

import '../../Constants/const_colors.dart';

class HomePage extends GetView<HomeController> {
  final HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: preto_forte,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildFeaturedEventsSection(),
              _buildAllEventsSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeaturedEventsSection() {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Container(
          color: preto_fraco,
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Chip(
                backgroundColor: Colors.red[200],
                label: Text(
                  "Populars",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              SizedBox(height: 5),
              Container(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.featuredEvents.length,
                  controller: controller.scrollController,
                  itemBuilder: (context, index) {
                    EventModel event = controller.featuredEvents[index];
                    return Card(
                      elevation: 4,
                      child: Container(
                        height: 200,
                        width: 200,
                        child: Image.network(
                          event.bannerUrl!,
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAllEventsSection() {
    return GetBuilder<HomeController>(
      builder: (controller) {
        if (controller.status.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (controller.status.isEmpty) {
          return Center(
            child: Text('All Party will be displayed here'),
          );
        } else if (controller.status.isError) {
          return Center(
            child: Text(controller.status.errorMessage!),
          );
        } else if (controller.status.isSuccess) {
          return RefreshIndicator(
            onRefresh: controller.refrechData,
            backgroundColor: preto_forte,
            color: branco,
            displacement: 25,
            edgeOffset: 2,
            child: Container(
              height: Get.height,
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: TextButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              IconlyLight.location,
                              color: cinza_w500,
                              size: 20,
                            ),
                            label: Text(
                              "Essen",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.lightBlueAccent,
                              ),
                            ),
                          ),
                        ),
                        Chip(
                          label: Text("Filter"),
                          avatar: Icon(IconlyLight.filter),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.allEvents.length,
                      itemBuilder: (context, index) {
                        EventModel event = controller.allEvents[index];
                        return Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            height: 180,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(event.bannerUrl!),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          event.title!,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: cinza_w500,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          event.cityName!,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: cinza_w500,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          event.placeName!,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: cinza_w500,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  'DATUM',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    color: vermelho,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  '${DateFormat('dd.MM.yy').format(event.startDate!)}',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  '${DateFormat('dd.MM.yy').format(event.endDate!)}',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(width: 20),
                                            Column(
                                              children: [
                                                Text(
                                                  'TIME',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    color: vermelho,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  '${DateFormat('dd.MM.yy').format(event.startDate!)}',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  '${DateFormat('dd.MM.yy').format(event.endDate!)}',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, right: 20),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 15,
                                        backgroundColor: preto_forte,
                                        child: Icon(
                                          Icons.favorite_border_outlined,
                                          color: branco,
                                          size: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Center(
            child: Text(controller.status.errorMessage!),
          );
        }
      },
    );
  }
}
