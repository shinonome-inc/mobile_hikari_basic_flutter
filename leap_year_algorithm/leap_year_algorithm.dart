import 'dart:io';

bool isLeapYear() {
  print('西暦を入力してください。');
  String input = stdin.readLineSync() ?? ''; // 標準入力から文字列を読み込む
  int number = int.parse(input); // 文字列を整数に変換

  if (number % 100 == 0 && number % 400 != 0) {
    return false;
  } else if (number % 4 == 0) {
    return true;
  } else {
    return false;
  }
}

void main() {
  print(isLeapYear());
}
