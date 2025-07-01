import 'dart:async';

abstract class LocalDatasource<T> {
  final StreamController<T> dataStreamController = StreamController();

  void dispose();
}
