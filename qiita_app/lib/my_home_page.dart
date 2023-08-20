import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TopPage extends StatelessWidget {
  const TopPage({Key? key, required this.title}) : super(key: key);

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
          Container(
            color: Colors.black.withOpacity(0.2),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const Spacer(flex: 1),
                  const Text(
                    "Qiita Feed App",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontFamily: 'Pacifico-Regular',
                    ),
                  ),
                  const Gap(8),
                  const Text(
                    "-PlayGround-",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  const Spacer(flex: 2),
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
                  const Text(
                    "ログインせずに利用する",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(flex: 1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
