

typedef AddEvent<T> = void Function(T input);

abstract class AngryUserController<T> {
  /// [waitingDuration] is the time window to detect [angryCount] that will represent user is angry
  void init({Duration waitingDuration, int angryCount = 5});

  /// emit event using this function
  AddEvent<T> get addUserClicked;

  /// stream to subscribe on when user is angry
  Stream<List<T>> get userAngryStream;

  /// stream to subscribe on clicked action
  Stream<T> get userClickedStream;
}
