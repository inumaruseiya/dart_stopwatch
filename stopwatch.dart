import 'dart:io';

void main() {
  final stopwatch = Stopwatch()..start();
  print('ストップウォッチを停止するにはEnterを入力してください。');
  stdin.listen((data) {
    stopwatch.stop();
    print('ストップウォッチを停止しました。経過時間: ${stopwatch.elapsed}');
    exit(0); 
  });
}

