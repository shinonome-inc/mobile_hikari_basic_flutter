import 'dart:io';
import 'dart:math' as math;

void janken(String hand) {
  final handCp = math.Random().nextInt(3);
  String handCpString;
  int handYou;

  // cpの手を格納
  if (handCp == 0) {
    handCpString = "rock";
  } else if (handCp == 1) {
    handCpString = "scissors";
  } else if (handCp == 2) {
    handCpString = "paper";
  } else {
    print("system error");

    return;
  }

  // 入力された手を数値として変数に格納
  if (hand == "rock") {
    handYou = 0;
  } else if (hand == "scissors") {
    handYou = 1;
  } else if (hand == "paper") {
    handYou = 2;
  } else {
    handYou = 99;
    print("Your hand is invalid");

    return;
  }

  // じゃんけんの結果を判定
  if (handYou == handCp) {
    print("cp: $handCpString, draw...");

    return;
  } else if ((handYou + 1) % 3 == handCp) {
    print("cp: $handCpString, you won!");

    return;
  } else {
    print("cp: $handCpString, you lost.");

    return;
  }
}

void main() {
  stdout.write('Please enter your hand (rock/paper/scissors): ');
  final handYou = stdin.readLineSync();
  if (handYou != null) {
    janken(handYou);

    return;
  } else {
    stdout.write(
        'Your hand is null. Please enter your hand (rock/paper/scissors): ');

    return;
  }
}
