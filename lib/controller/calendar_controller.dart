import 'package:flutter/material.dart';
import 'package:get/get.dart';

var calendarController = Get.put(CalendarController());

class CalendarController extends GetxController {
  @override
  void onInit() {
    today = DateTime.now();
    selectedEvents = ValueNotifier(getEventsForDay(today!));
    super.onInit();
  }

  DateTime? today;
  DateTime focusedDay = DateTime.now();
  var eventsController = TextEditingController();
  Map<DateTime, List<Event>> events = {};
  late final ValueNotifier<List<Event>> selectedEvents;

  void onDaySelected(DateTime day, DateTime focusedDay) {
    today = day;
    selectedEvents.value = getEventsForDay(day);
    this.focusedDay = focusedDay;
    update();
  }

  List<Event> getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }
}

class Event {
  late String title;

  Event(this.title);
}

class EventModel {
  late String title;
  late String date;

  EventModel({required this.title, required this.date});

  factory EventModel.fromJson(Map<String?, dynamic> json) {
    return EventModel(title: json['title'], date: json['date']);
  }
}
