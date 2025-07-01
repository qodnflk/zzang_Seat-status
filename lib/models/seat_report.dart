class SeatReport {
  final String seatNumber;
  String? imagePath;
  String title;
  Map<String, bool> problems;
  String memo;

  SeatReport({
    required this.seatNumber,
    this.imagePath,
    this.title = '',
    Map<String, bool>? problems,
    this.memo = '',
  }) : problems = problems ??
            {
              '헤드셋 문제': false,
              '충전기 문제': false,
              '모니터 문제': false,
              'PC문제': false,
              '의자 문제': false,
            };
}
