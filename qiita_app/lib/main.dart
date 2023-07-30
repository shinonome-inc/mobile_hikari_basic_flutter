import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Leap Year Algorithm App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(title: 'Main Page'),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late String seireki;
  String res = "";
  final String errorMessage = "Error";

  static bool isLeapYear(int number) {
    if (number % 100 == 0 && number % 400 != 0) {
      return false;
    } else if (number % 4 == 0) {
      return true;
    } else {
      return false;
    }
  }

  void onClicked() {
    if (int.tryParse(seireki) != null) {
      int parsedSeireki = int.parse(seireki);
      setState(() {
        res = isLeapYear(parsedSeireki)
            ? "$parsedSeireki is Leap Year"
            : "$parsedSeireki is not Leap Year";
      });
    } else {
      setState(() {
        res = errorMessage;
      });
    }
  }

  void onChanged(String value) {
    setState(() {
      seireki = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(res),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: TextField(
                enabled: true,
                style: const TextStyle(color: Colors.black),
                obscureText: false,
                maxLines: 1,
                onChanged: onChanged,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
              onPressed: onClicked,
              child: const Text('RUN'),
            )
          ],
        ),
      ),
    );
  }
}
