import 'package:flutter_sample/core/logger/models/log_level_enum.dart';
import 'package:rxdart/rxdart.dart';

import '../../core/logger/logger_lib.dart';
import 'angry_user_controller.dart';
import 'models/angry_event_model.dart';

class AngryUserControllerImpl implements AngryUserController<AngryEventModel> {
  final _clickedMoreThanXTimes = BehaviorSubject<AngryEventModel>();
  final _userAngrySubject = BehaviorSubject<List<AngryEventModel>>();
  final Logger logger;

  AngryUserControllerImpl(this.logger);

  @override
  AddEvent<AngryEventModel> get addUserClicked => _clickedMoreThanXTimes.add;

  @override
  Stream<AngryEventModel> get userClickedStream => _clickedMoreThanXTimes.stream;

  @override
  Stream<List<AngryEventModel>> get userAngryStream => _userAngrySubject.stream;

  @override
  void init({Duration waitingDuration = const Duration(seconds: 2), int angryCount = 5}) {
    final eventCountInLastSecond = _clickedMoreThanXTimes.stream
        .buffer(Stream.periodic(waitingDuration, (i) => i))
        .where((event) => event.length >= angryCount);

    eventCountInLastSecond.listen((eventList) async {
      _userAngrySubject.add(eventList);
      logger.log(LogData(LogLevelEnum.info, 'user is angry and clicked: ${eventList.length} times'));
    });
  }
}
