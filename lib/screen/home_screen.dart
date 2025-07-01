import 'package:flutter/material.dart';
import 'package:flutter_application_1/tabs/first_floor.dart';
import 'package:flutter_application_1/tabs/second_floor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List pages = [const FirstFloor(), const SecondFloor()];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('PC현황'),
          bottom: const TabBar(
            tabs: [
              Tab(text: '1층'),
              Tab(text: '2층'),
            ],
          ),
        ),
        body: TabBarView(children: [pages[0], pages[1]]),
      ),
    );
  }
}
