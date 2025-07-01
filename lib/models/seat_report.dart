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
              '키보드 문제': false
            };
}

/* 

실생활의 예시로 설명하자면:

SeatReport는 마치 각 좌석마다 있는 "문제 신고 용지"와 같습니다.
이 용지에는 다음과 같은 정보들이 있습니다:
좌석 번호 (반드시 필요함)
문제 상황 사진 (있어도 되고 없어도 됨)
제목 (없으면 빈칸으로 둠)
체크리스트 (헤드셋, 충전기 등의 문제 여부)
추가 메모 (없으면 빈칸으로 둠)
체크리스트는 다음과 같은 항목들이 있고, 처음에는 모두 체크되지 않은 상태입니다:
헤드셋 문제
충전기 문제
모니터 문제
PC문제
의자 문제
이 코드를 통해 각 좌석마다 발생하는 문제들을 체계적으로 기록하고 관리할 수 있게 됩니다.





*/
