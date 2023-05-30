import 'dart:async';

import 'package:events_app_user/Services/Api/IRepository/IRepositoryEvent.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Models/event_model.dart';

class HomeController extends GetxController with StateMixin {
  final IRepositoryEvent _repositoryEvent;
  HomeController(this._repositoryEvent);
  final RxList<EventModel> allEvents = RxList<EventModel>([]);
  final RxList<EventModel> featuredEvents = RxList<EventModel>([]);
  final formatter = DateFormat('dd-MM-yyyy');
  var isLoading = false.obs;
  Timer? scrollTimer;
  ScrollController scrollController =
      ScrollController(initialScrollOffset: 0.0);

  @override
  void onInit() {
    super.onInit();
    startAutoScroll();
  }

  @override
  void onClose() {
    scrollTimer?.cancel();
    scrollController.dispose();
    super.onClose();
  }

  void startAutoScroll() {
    scrollTimer = Timer.periodic(Duration(seconds: 10), (timer) {
      if (scrollController.hasClients) {
        final maxScrollExtent = scrollController.position.maxScrollExtent;
        final nextOffset = scrollController.offset + 200;
        if (nextOffset >= maxScrollExtent) {
          scrollController.animateTo(0,
              duration: Duration(milliseconds: 800), curve: Curves.easeInOut);
        } else {
          scrollController.animateTo(nextOffset,
              duration: Duration(milliseconds: 800), curve: Curves.easeInOut);
        }
      }
    });
  }

  @override
  void onReady() async {
    //errorLoadMessage.value;
    await loadAllEvents();
    await loadFeaturedEvents();
    super.onReady();
  }

  Future<void> loadAllEvents() async {
    // try {
    change(null, status: RxStatus.loading());
    List<EventModel> response = await _repositoryEvent.getAllEvents();
    update();
    if (response.isEmpty) {
      change([], status: RxStatus.error());
      allEvents.clear();
      allEvents.value = [];
      return null;
    } else
      change(response, status: RxStatus.success());
    allEvents.assignAll(response);
    print("ALL EVENTS $response");
    // }
    //catch (error) {
    //   change(null, status: RxStatus.error(error.toString()));
    //   print("${error.toString()}");
    //   allEvents.clear();
    //   allEvents.value = [];
    // }
  }

  Future<void> loadFeaturedEvents() async {
    try {
      change([], status: RxStatus.loading());
      List<EventModel> response = await _repositoryEvent.getFeaturedEvents();
      update();
      if (response.isEmpty) {
        change([], status: RxStatus.error());
        featuredEvents.clear();
        featuredEvents.value = [];
        return null;
      } else {
        change(response, status: RxStatus.success());
        featuredEvents.assignAll(response);
        print("Featured Events $response");
      }
    } catch (error) {
      change([], status: RxStatus.error(error.toString()));
      print("${error.toString()}");
      featuredEvents.clear();
      featuredEvents.value = [];
    }
  }

  Future<void> refrechData() async {
    isLoading.value = true;
    loadAllEvents();
    isLoading.value = false;
    update();
    print(isLoading.value);
  }
}
