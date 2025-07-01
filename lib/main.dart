import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screen/home_screen.dart';
import 'providers/seat_reports_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SeatReportsProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PC방 관리',
      home: HomeScreen(),
    );
  }
}
