import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qiita App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'TopPage'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('./assets/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Black overlay with opacity
          Container(
            color: Colors.black.withOpacity(0.2),
          ),
          // Centered content
          Center(
            child: Column(
              children: const [
                Gap(220),
                Text(
                  "Qiita Feed App",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontFamily: 'Pacifico-Regular',
                  ),
                ),
                Gap(8),
                Text(
                  "-PlayGround-",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            ),
          ),
          // Bottom section
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Login button
                  SizedBox(
                    width: double.infinity,
                    height: 50.0,
                    child: TextButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<OutlinedBorder?>(
                          const StadiumBorder(),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color?>(
                          const Color(0xFF468300),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "ログイン",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const Gap(34),
                  // Non-login option
                  const Text(
                    "ログインせずに利用する",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Gap(80),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
