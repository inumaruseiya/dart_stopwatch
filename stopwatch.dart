import 'dart:io';

class Stopwatch {
  DateTime? _startTime;
  Duration _elapsed = Duration.zero;

  void start() {
    _startTime = DateTime.now();
  }

  void stop() {
    if (_startTime != null) {
      _elapsed = DateTime.now().difference(_startTime!);
      _startTime = null;
    }
  }

  Duration get elapsed => _elapsed;
}

class Explanation {
  void introduction() {
    print('スタート/ストップを切り替えるには "s" を、終了するには "q" を押してください。');
  }

  void start() {
    print('ストップウォッチを開始しました。');
  }

  void stop(Stopwatch stopwatch) {
    print('ストップウォッチを停止しました。時間: ${stopwatch.elapsed.inMinutes}:${stopwatch.elapsed.inSeconds}:${stopwatch.elapsed.inMilliseconds}');
  }
}

class handleKeyInput {

  void _handleKeyInput(Stopwatch stopwatch) {
    stdin.listen((List<int> data) {
      final key = String.fromCharCodes(data).trim();
      final explanation = Explanation();
      switch (key) {
        case 's':
          if (stopwatch._startTime == null) {
            stopwatch.start();
            explanation.start();
          } else {
            stopwatch.stop();
            explanation.stop(stopwatch);
          }
          break;
        case 'q':
          exit(0);
      }
    });
  }
  
}

void main() {
  final stopwatch = Stopwatch();
  final explanation = Explanation();

  explanation.introduction();
  handleKeyInput()._handleKeyInput(stopwatch);
}
