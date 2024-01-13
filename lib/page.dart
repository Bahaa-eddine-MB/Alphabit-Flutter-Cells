import 'package:first_session/myWidget.dart';
import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> myList =
        List.generate(26, (index) => String.fromCharCode(index + 65));
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
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.blue[900],
                    borderRadius: const BorderRadius.all(Radius.circular(15))),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
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
                      height: 20,
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
            const SizedBox(
              height: 20,
            ),
            Text("Lets get started",
                style: TextStyle(
                    color: Colors.blue[900],
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 20,
            ),
            const Text("Create new account",
                style: TextStyle(color: Colors.grey, fontSize: 15)),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                height: 50,
                child: ListView.builder(
                  itemCount: myList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return MyWidget(text: myList[index]);
                  },
                )),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () {
                      print("clicked !");
                    },
                    child: const Text(
                      "Sign up",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Have an account"),
                TextButton(onPressed: () {}, child: const Text("Sign in"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
