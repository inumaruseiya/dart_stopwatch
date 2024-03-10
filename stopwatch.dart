import 'dart:io';

void main() {
  final stopwatch = Stopwatch()..start();
  print('ストップウォッチを停止するにはEnterを入力してください。');
  stdin.listen((data) {
    // キー入力があった場合
    stopwatch.stop();
    print('\nストップウォッチを停止しました。経過時間: ${stopwatch.elapsed}');
    exit(0); // プログラムを終了
  });
}

