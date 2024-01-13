import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 50,
      height: 50,
      decoration:  BoxDecoration(
        color: Colors.grey[300],
        borderRadius: const BorderRadius.all(Radius.circular(50)),
      ),
      child: Center(
          child: Text(
        text,
        style: const TextStyle(color: Colors.black87),
      )),
    );
  }
}
