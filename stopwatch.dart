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

void main() {
  var stopwatch = Stopwatch();
  print('スタート/ストップを切り替えるには "s" を、終了するには "q" を押してください。');


  // キー入力の監視
  stdin.listen((List<int> data) {
    var key = String.fromCharCodes(data).trim();
    switch (key) {
      case 's':
        if (stopwatch._startTime == null) {
          stopwatch.start();
          print('ストップウォッチを開始しました。');
        } else {
          stopwatch.stop();
          print('ストップウォッチを停止しました。時間: ${stopwatch.elapsed.inMinutes}:${stopwatch.elapsed.inSeconds}:${stopwatch.elapsed.inMilliseconds}');
        }
        break;
      case 'q':
        exit(0);
    }
  });
}


