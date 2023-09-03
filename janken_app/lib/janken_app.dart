import 'dart:math' as math;
import 'package:flutter/material.dart';

class JankenApp extends StatelessWidget {
  const JankenApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Janken App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(title: 'Janken App'),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});
  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isDisplay = true;
  String result = "";

  @override
  Widget build(BuildContext context) {
    void vanish() {
      setState(() {
        isDisplay = false;
      });
      // 3秒後にisDisplayをtrueに戻す
      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          isDisplay = true;
        });
      });
    }

    void janken(int handYou) {
      final handCp = math.Random().nextInt(3);
      String handCpString;

      vanish();

      // cpの手を格納
      if (handCp == 0) {
        handCpString = "rock";
      } else if (handCp == 1) {
        handCpString = "scissors";
      } else if (handCp == 2) {
        handCpString = "paper";
      } else {
        return;
      }

      // じゃんけんの結果を判定
      if (handYou == handCp) {
        result = "cp: $handCpString, draw...";

        return;
      } else if ((handYou + 1) % 3 == handCp) {
        result = "cp: $handCpString, you won!";

        return;
      } else {
        result = "cp: $handCpString, you lost.";

        return;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            if (isDisplay) const SizedBox(height: 100),
            if (isDisplay)
              SizedBox(
                height: 130, // Add a comma after this line
                child: Image.asset('images/sazae.png'),
              ),
            if (isDisplay) const Text("Let's play Janken!"),
            if (isDisplay) const Text("Select your hand !"),
            if (isDisplay)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isDisplay)
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: IconButton(
                        onPressed: () => janken(0),
                        icon: Image.asset("images/rock.png"),
                      ),
                    ),
                  if (isDisplay)
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: IconButton(
                        onPressed: () => janken(1),
                        icon: Image.asset("images/scissors.png"),
                      ),
                    ),
                  if (isDisplay)
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: IconButton(
                        onPressed: () => janken(2),
                        icon: Image.asset("images/paper.png"),
                      ),
                    ),
                ],
              ),
            if (!isDisplay) Text(result),
            if (!isDisplay) Image.asset("images/fin.jpeg"),
            if (!isDisplay) const Text("Enjoy next round!!"),
          ],
        ),
      ),
    );
  }
}
