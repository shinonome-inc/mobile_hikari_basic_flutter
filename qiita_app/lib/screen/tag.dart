import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  const Tag({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return const Text("Tag");
  }
}
