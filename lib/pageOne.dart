import 'package:first_session/PageTow.dart';
import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          //container widget
          Container(
            //decoration
            decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            height: 100,
            width: 180,
          ),
          //sized box widget which is an empty box used to create white spaces
          const SizedBox(
            height: 10,
          ),

          //Center Widget
          Center(
            child: Container(),
          ),
          
          //Network Image
          Image.network(
            "https://miro.medium.com/v2/resize:fit:1100/format:webp/1*kQVKvFSFhWpRPBPVBFNPfg.png",
            height: 100,
          ),
          //Local image
          // Image(
          //   image: AssetImage("test.webp"),
          //   height: 100,
          // ),

          const SizedBox(
            height: 10,
          ),
          // Column widget
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.red,
                height: 50,
                width: 50,
              ),
              Container(
                color: Colors.blue,
                height: 50,
                width: 50,
              ),
              Container(
                color: Colors.green,
                height: 50,
                width: 50,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          // Row widget
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.red,
                height: 50,
                width: 50,
              ),
              Container(
                color: Colors.blue,
                height: 50,
                width: 50,
              ),
              Container(
                color: Colors.green,
                height: 50,
                width: 50,
              ),
            ],
          ),
          // List View widget to give scroll scroll behavior
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  color: Colors.red,
                  height: 50,
                  width: 150,
                ),
                Container(
                  color: Colors.blue,
                  height: 50,
                  width: 150,
                ),
                Container(
                  color: Colors.green,
                  height: 50,
                  width: 150,
                ),
                Container(
                  color: Colors.black,
                  height: 50,
                  width: 150,
                ),
              ],
            ),
          ),

          //elevated button widget
          ElevatedButton(
              // pressing function

              onPressed: () {
                print("hello");
                // navigationg to pageTow
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PageTow()),
                );
              },
              child: Text("Got to page tow")),

          //text button widget
          TextButton(
              // pressing function
              onPressed: () {
                // Going back
                Navigator.pop(context);

                print("hello");
              },
              child: Text("Go back"))
        ],
      ),
    );
  }
}
