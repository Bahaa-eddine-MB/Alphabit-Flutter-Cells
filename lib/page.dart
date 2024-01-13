import 'package:first_session/myWidget.dart';
import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> myList = ["A", "B", "C", "A", "B", "C", "A", "B", "C"];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Padding(
                        padding: const EdgeInsets.all(30),
                        child: Center(
                            child: Image.network(
                          "https://avatars.githubusercontent.com/u/25725704?s=200&v=4",
                          height: 100,
                        )),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      'Rise the bar higher',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            const Text("Rise the bar higher"),
            const Text("Rise the bar higher"),
            SizedBox(
                height: 50,
                child: ListView.builder(
                  itemCount: myList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return MyWidget(text: myList[index]);
                  },
                )),
            ElevatedButton(
                onPressed: () {
                  print("clicked !");
                },
                child: Text("Sign up")),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Have an account"),
                TextButton(onPressed: () {}, child: Text("Sign in"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
