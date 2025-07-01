import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

enum InternetStatus { NO_INTERNET, LOADING, INTERNET }

class AppInternetStatus {

  static final AppInternetStatus _instance = AppInternetStatus._internal();

  factory AppInternetStatus() => _instance;

  AppInternetStatus._internal();

  final Connectivity _connectivity = Connectivity();

  final StreamController<InternetStatus> _connectionChangedController = StreamController.broadcast();

  Stream<InternetStatus> get connectionChangedStream => _connectionChangedController.stream;

  void _connectivityStateChanged(ConnectivityResult result) {
    if (result != ConnectivityResult.bluetooth) {
      _checkConnection();
    }
  }

  static void initialize() {
    _instance._checkConnection();
    _instance._connectivity.onConnectivityChanged.listen(_instance._connectivityStateChanged);
  }

  void dispose() {
    _connectionChangedController.close();
  }

  void _checkConnection() async {
    try {
      final result = await InternetAddress.lookup("www.google.com");
      if (result.isNotEmpty) {
        _connectionChangedController.sink.add(InternetStatus.INTERNET);
        return;
      }
      _connectionChangedController.sink.add(InternetStatus.NO_INTERNET);
    } on SocketException catch (_) {
      _connectionChangedController.sink.add(InternetStatus.NO_INTERNET);
    }

  }


}