import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:women_health_tracker/facility/firebase_firestore_database.dart';
import 'package:women_health_tracker/screens/component/bg_color_method.dart';
import 'package:women_health_tracker/screens/component/input_box_method.dart';

import '../../controller/calendar_controller.dart';
import '../../facility/firebase_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome",
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: .5),
        ),
        backgroundColor: Color(0xFFEAC1C1),
      ),

      body: FutureBuilder(
        future: FirebaseFireStoreDatabase.fireStoreDatabase.readEvent(
          email: FireAuth.fireAuth.currentUser()!.email!,
        ),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            try {
              Map<String, Object?> data = snapshot.data.data();
              calendarController.events.addAll({
                DateTime.parse(data.keys.first): [
                  Event(data.values.toString()),
                ],
              });
            } catch (e) {
              calendarController.events.addAll({
                DateTime.now(): [Event("")],
              });
            }

            return bgColorMethod(
              method: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    GetBuilder<CalendarController>(
                      builder:
                          (controller) => TableCalendar(
                            onDaySelected: calendarController.onDaySelected,
                            focusedDay: calendarController.focusedDay,
                            selectedDayPredicate: (day) {
                              return isSameDay(controller.today, day);
                            },
                            eventLoader: calendarController.getEventsForDay,
                            calendarStyle: CalendarStyle(
                              todayDecoration: BoxDecoration(
                                color: Colors.pink.shade200,
                                border: Border.all(color: Colors.pink.shade100),
                                shape: BoxShape.circle,
                              ),
                              selectedDecoration: BoxDecoration(
                                color: Colors.pinkAccent,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.pinkAccent),
                              ),
                              selectedTextStyle: const TextStyle(
                                fontSize: 19,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                              todayTextStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              defaultTextStyle: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                letterSpacing: .2,
                                fontSize: 15,
                              ),
                            ),
                            calendarFormat: CalendarFormat.week,
                            locale: "en_US",
                            headerStyle: const HeaderStyle(
                              titleCentered: true,
                              formatButtonVisible: false,
                              titleTextStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                letterSpacing: .5,
                              ),
                            ),
                            firstDay: DateTime.utc(2000, 01, 01),
                            lastDay: DateTime.utc(2050, 12, 12),
                          ),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: ValueListenableBuilder<List<Event>>(
                        valueListenable: calendarController.selectedEvents,
                        builder:
                            (context, value, child) => ListView.builder(
                              itemCount: value.length,
                              itemBuilder:
                                  (context, index) => GestureDetector(
                                    onTap: () {
                                      showDialog<void>(
                                        context: context,
                                        // false = user must tap button, true = tap outside dialog
                                        builder: (BuildContext dialogContext) {
                                          return AlertDialog(
                                            title: Text('Today Task'),
                                            content: Text(value[index].title),
                                            actions: <Widget>[
                                              TextButton(
                                                child: Text("completed"),
                                                onPressed: () {
                                                  calendarController.events
                                                      .remove(
                                                        calendarController
                                                            .today,
                                                      );
                                                  setState(() {});
                                                  Navigator.of(
                                                    dialogContext,
                                                  ).pop(); // Dismiss alert dialog
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: Card(
                                      color: Colors.pink.shade50,
                                      child: ListTile(
                                        title: Text(
                                          value[index].title,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: .5,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Icon(Icons.error_outline);
          } else {
            return bgColorMethod(
              method: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [CircularProgressIndicator()],
                  ),
                ],
              ),
            );
          }
        },
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          showDialog<void>(
            context: context,
            builder: (BuildContext dialogContext) {
              return AlertDialog(
                backgroundColor: Color(0xFFEAC1C1),
                title: Text('Add Today Task'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 700,
                      child: inputBoxMethod(
                        hintText: "Add Task",
                        controller: calendarController.eventsController,
                      ),
                    ),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text('save'),
                    onPressed: () async {
                      calendarController.events.addAll({
                        calendarController.today!: [
                          Event(calendarController.eventsController.text),
                        ],
                      });
                      await FirebaseFireStoreDatabase.fireStoreDatabase
                          .addEvent(
                            email: FireAuth.fireAuth.currentUser()!.email!,
                            date: calendarController.today!.toString(),
                            event: calendarController.eventsController.text,
                          );
                      calendarController.eventsController.clear();
                      calendarController
                          .selectedEvents
                          .value = calendarController.getEventsForDay(
                        calendarController.today!,
                      );

                      Navigator.of(dialogContext).pop(); // Dismiss alert dialog
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.pinkAccent.shade200,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.add, size: 25, color: Colors.white),
        ),
      ),
    );
  }
}
