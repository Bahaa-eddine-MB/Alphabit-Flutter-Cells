import 'package:first_session/pageOne.dart';
import 'package:flutter/material.dart';

class PageTow extends StatelessWidget {
  const PageTow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          ElevatedButton(
              onPressed: () {
                print("hello");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PageOne()),
                );
              },
              child: Text("Go to page one")),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
                print("hello");
              },
              child: Text("Go  back"))
        ],
      ),
      width: 500,
      height: 500,
    );
  }
}
