import 'package:flutter/foundation.dart';
import '../models/seat_report.dart';

class SeatReportsProvider with ChangeNotifier {
  final Map<String, SeatReport> _reports = {};

  //좌석 번호를 받아서 해당 좌석 정보를 가져옴 
  SeatReport getReport(String seatNumber) {
    return _reports[seatNumber] ?? SeatReport(seatNumber: seatNumber);
  }

  //새로운 좌석 번호를 저장하거나 기존정보를 업데이트 
  void updateReport(SeatReport report) {
    _reports[report.seatNumber] = report;
    notifyListeners();
  }
}


/*
쉬운 비유로 설명하자면:
이 코드는 마치 PC방의 관리 시스템과 같습니다.

_reports는 큰 캐비닛이라고 생각하면 됩니다:
각 서랍(좌석)은 고유한 번호가 있고
각 서랍 안에는 그 좌석의 모든 정보(문제사항, 메모 등)가 들어있습니다.

getReport는 캐비닛에서 특정 번호의 서랍을 찾아보는 것과 같습니다:
서랍에 정보가 있으면 그 정보를 가져오고
비어있다면 새로운 빈 정보를 만들어줍니다.

updateReport는 서랍에 새로운 정보를 넣거나 기존 정보를 수정하는 것과 같습니다:
정보를 저장하고
다른 사람들에게 "정보가 변경되었어요!"라고 알려주는 역할을 합니다.
이 코드 덕분에 우리가 어떤 좌석의 정보를 저장하면, 그 정보가 앱이 실행되는 동안 계속 유지되고, 나중에 다시 그 좌석을 확인할 때 저장된 정보를 볼 수 있게 됩니다.

*/