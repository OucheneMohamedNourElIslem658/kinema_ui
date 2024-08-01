import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kinema/features/event/repositories/events.dart';
import 'package:kinema/commun/models/event.dart';

class EventController extends GetxController{
  List<EventModel> events = [];
  final _eventsRepo = EventsRepo();

  Future<void> getEvents() async {
    events = (await _eventsRepo.getEvents()) ?? [];
    update();
  }

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await getEvents();
    });
    super.onInit();
  }
}