import 'package:flutter/material.dart';

class Feed extends StatelessWidget {
  const Feed({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return const Text("Feed");
  }
}
