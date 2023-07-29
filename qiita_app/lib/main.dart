import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key})
      : super(key: key); // Use 'Key?' instead of 'super.key'.

  // This widget is the root of your application.
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
  late String seireki; // Initialize seireki with a default value of 0.
  String res = "";

  bool isLeapYear(int number) {
    if (number % 100 == 0 && number % 400 != 0) {
      return false;
    } else if (number % 4 == 0) {
      return true;
    } else {
      return false;
    }
  }

  String assignSeireki(int seireki) {
    if (isLeapYear(seireki)) {
      return "$seireki is Leap Year";
    } else {
      return "$seireki is not Leap Year";
    }
  }

  void onClicked() {
    if (int.tryParse(seireki) != null) {
      setState(() {
        res = assignSeireki(int.parse(seireki));
      });
    } else {
      setState(() {
        res = "Error";
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
            TextField(
              enabled: true,
              style: const TextStyle(color: Colors.red),
              obscureText: false,
              maxLines: 1,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onClicked,
        child: const Text("RUN"),
      ),
    );
  }
}
