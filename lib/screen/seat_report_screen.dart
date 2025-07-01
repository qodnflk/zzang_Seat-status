import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../providers/seat_reports_provider.dart';
import '../models/seat_report.dart';

class SeatReportScreen extends StatefulWidget {
  final String seatNumber;

  const SeatReportScreen({super.key, required this.seatNumber});

  @override
  State<SeatReportScreen> createState() => _SeatReportScreenState();
}

class _SeatReportScreenState extends State<SeatReportScreen> {
  File? _image;
  final _titleController = TextEditingController();
  final _memoController = TextEditingController();
  Map<String, bool> _problems = {
    '헤드셋 문제': false,
    '충전기 문제': false,
    '모니터 문제': false,
    'PC문제': false,
    '의자 문제': false,
  };

  @override
  void initState() {
    super.initState();
    // 기존 데이터 불러오기
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final report =
          context.read<SeatReportsProvider>().getReport(widget.seatNumber);
      setState(() {
        _titleController.text = report.title;
        _memoController.text = report.memo;
        if (report.imagePath != null) {
          _image = File(report.imagePath!);
        }
        _problems = Map.from(report.problems);
      });
    });
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _saveReport() {
    final report = SeatReport(
      seatNumber: widget.seatNumber,
      imagePath: _image?.path,
      title: _titleController.text,
      problems: _problems,
      memo: _memoController.text,
    );

    context.read<SeatReportsProvider>().updateReport(report);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('저장되었습니다')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('${widget.seatNumber}번 좌석'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 이미지 선택 영역
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: _image != null
                    ? Image.file(_image!, fit: BoxFit.cover)
                    : const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_photo_alternate, size: 50),
                            Text('이미지를 선택하세요'),
                          ],
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 16),

            // 제목 입력
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: '제목',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // 문제 체크박스들
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: _problems.entries.map((entry) {
                    return CheckboxListTile(
                      title: Text(entry.key),
                      value: entry.value,
                      onChanged: (bool? value) {
                        setState(() {
                          _problems[entry.key] = value ?? false;
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 메모 입력
            TextField(
              controller: _memoController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: '메모',
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
            ),

            const SizedBox(height: 16),

            // 저장 버튼
            ElevatedButton(
              onPressed: _saveReport,
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text('저장하기'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _memoController.dispose();
    super.dispose();
  }
}
