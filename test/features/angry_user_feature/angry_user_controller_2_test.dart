import 'package:flutter/material.dart';
import 'package:flutter_sample/core/logger/logger_lib.dart';
import 'package:flutter_sample/features/angry_user_feature/angry_user_controller.dart';
import 'package:flutter_sample/features/angry_user_feature/angry_user_controller_impl.dart';
import 'package:flutter_sample/features/angry_user_feature/models/angry_event_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Logger mockLogger;
  late AngryUserController controller;

  setUp(() {
    mockLogger = ConsoleLogger();
    controller = AngryUserControllerImpl(mockLogger);
    controller.init(waitingDuration: const Duration(milliseconds: 500), angryCount: 3);
  });

  test('addUserClicked adds an event to the stream', () {
    final event = AngryEventModel(DragDownDetails());
    controller.addUserClicked(event);
    expectLater(
      controller.userClickedStream,
      emits(event),
    );
  });

  test('init adds events to the stream when pass events count after a given time period', () {
    final event1 = AngryEventModel(DragDownDetails());
    final event2 = AngryEventModel(DragDownDetails());
    final event3 = AngryEventModel(DragDownDetails());
    final event4 = AngryEventModel(DragDownDetails());

    controller.addUserClicked(event1);
    controller.addUserClicked(event2);
    controller.addUserClicked(event3);
    controller.addUserClicked(event4);

    expectLater(
      controller.userAngryStream,
      emits([event1, event2, event3, event4]),
    );
  });

  test('count of events must be the max reached after waitingDuration', () async{
    final event = AngryEventModel(DragDownDetails());
    for(int i = 0; i < 7 ;++i){
      controller.addUserClicked(event);
      await Future.delayed(Duration(milliseconds: 100));
    }

    expectLater(
      controller.userAngryStream,
      emits(new List.generate(5, (index) {
          return event;
      })),
    );
  });


}
