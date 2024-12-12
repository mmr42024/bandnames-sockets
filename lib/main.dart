import 'package:band_names/pages/status_page.dart';
import 'package:band_names/services/socket_service.dart';
import 'package:flutter/material.dart';

import 'package:band_names/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SocketServiceNotifier()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'home',
        routes: {
          'home': (_) => const HomePage(),
          'status': (_) => const StatusPage(),
        },
      ),
    );
  }
}
