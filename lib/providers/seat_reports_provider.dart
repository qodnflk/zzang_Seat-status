import 'package:flutter/foundation.dart';
import '../models/seat_report.dart';

class SeatReportsProvider with ChangeNotifier {
  final Map<String, SeatReport> _reports = {};

  SeatReport getReport(String seatNumber) {
    return _reports[seatNumber] ?? SeatReport(seatNumber: seatNumber);
  }

  void updateReport(SeatReport report) {
    _reports[report.seatNumber] = report;
    notifyListeners();
  }
}
