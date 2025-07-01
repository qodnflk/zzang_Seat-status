import 'package:flutter/material.dart';
import '../screen/seat_report_screen.dart';

class FirstFloor extends StatelessWidget {
  const FirstFloor({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 161,
      itemBuilder: (context, index) {
        if (index < 123) {
          return ListTile(
            title: Text('${index + 1}번 좌석'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SeatReportScreen(
                    seatNumber: '${index + 1}',
                  ),
                ),
              );
            },
          );
        } else if (index == 123) {
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
            title: Text('${index + 53}번 좌석'),
            subtitle: const Text('프리미엄'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SeatReportScreen(
                    seatNumber: '${index + 53}',
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
