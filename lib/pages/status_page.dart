import 'package:band_names/services/socket_service.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketServiceNotifier>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Server status: ${socketService.serverStatus}')],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          socketService.emit('send-message', {
            'name': 'Fluttter',
            'message': 'Hola desde flutter',
          });
        },
        child: const Icon(Icons.message),
      ),
    );
  }
}
