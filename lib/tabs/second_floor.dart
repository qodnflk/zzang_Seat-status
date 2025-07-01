import 'package:flutter/material.dart';
import '../screen/seat_report_screen.dart';

class SecondFloor extends StatelessWidget {
  const SecondFloor({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 292,
      itemBuilder: (context, index) {
        if (index < 39) {
          return ListTile(
            title: Text('${index + 234}번 좌석'),
            subtitle: const Text('프리미엄'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SeatReportScreen(
                    seatNumber: '${index + 234}',
                  ),
                ),
              );
            },
          );
        } else if (index == 39) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            color: Colors.grey[200],
            child: const Center(
              child: Text(
                '프리미엄석',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          );
        } else {
          return ListTile(
            title: Text('${index + 233}번 좌석'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SeatReportScreen(
                    seatNumber: '${index + 233}',
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
