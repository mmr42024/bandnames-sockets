import 'package:flutter/material.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus { online, offline, connecting }

class SocketServiceNotifier extends ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.connecting;
  late IO.Socket _socket;

  SocketServiceNotifier() {
    _initConfig();
  }

  ServerStatus get serverStatus => _serverStatus;
  IO.Socket get socket => _socket;

  Function get emit => _socket.emit;

  void _initConfig() {
    _socket = IO.io('http://10.0.2.2:3000', {
      'transports': ['websocket'],
      'autoConnect': true,
    });
    _socket.onConnect((_) {
      _serverStatus = ServerStatus.online;
      notifyListeners();
    });

    _socket.onDisconnect((_) {
      _serverStatus = ServerStatus.offline;
      notifyListeners();
    });
  }
}
