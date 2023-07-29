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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int seireki = 0; // Initialize seireki with a default value of 0.
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

  String assignString(int number) {
    if (isLeapYear(number)) {
      return "$number is Leap Year";
    } else {
      return "$number is not Leap Year";
    }
  }

  void onButtonClicked() {
    // You can access the value of 'seireki' here.
    setState(() {
      res = assignString(
          seireki); // Trigger a rebuild of the widget tree with the updated value.
    });
    print(res);
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
              onChanged: (value) {
                // Call the getSeireki function and store its return value in 'seireki'.
                seireki = int.parse(value);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onButtonClicked,
        child: const Text("RUN"),
      ),
    );
  }
}
