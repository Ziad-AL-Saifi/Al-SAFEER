import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../const_color.dart';
import '../local/local_controller.dart';

class DrawerWid extends StatefulWidget {
  const DrawerWid({super.key});

  @override
  State<DrawerWid> createState() => _DrawerWidState();
}

class _DrawerWidState extends State<DrawerWid> {
  bool isVisible = false;
  bool aboutIsVisible = false;
  MylocaControllar mylocaControllar = Get.find();
  @override
  Widget build(BuildContext context) {
    var mWidth = MediaQuery.of(context).size.width;
    var mHeight = MediaQuery.of(context).size.height;
    return Drawer(
        width: mWidth / 2,
        backgroundColor: Colors.white,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Center(
                child: Text('We are the best'.tr),
              ),
            ),
            ListTile(
              title: Text('Language'.tr),
              hoverColor: kColor,
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                isVisible = !isVisible;
                setState(() {});
              },
            ),
            Visibility(
              visible: isVisible,
              child: Column(
                children: [
                  MaterialButton(
                    onPressed: () {
                      mylocaControllar.changeLang("ar");
                      setState(() {});
                    },
                    color: kColor,
                    textColor: Colors.white,
                    child: const Text("العربية"),
                  ),
                  SizedBox(
                    height: mHeight / 200,
                  ),
                  MaterialButton(
                    onPressed: () {
                      mylocaControllar.changeLang("en");
                      setState(() {});
                    },
                    color: kColor,
                    textColor: Colors.white,
                    child: const Text("English"),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('About us'.tr),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                aboutIsVisible = !aboutIsVisible;
                setState(() {});
              },
            ),
            Visibility(
              visible: aboutIsVisible,
              child: Container(
                height: mHeight / 2,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 225, 225, 225)),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(children: const []),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: mWidth / 10,
                    height: mHeight / 10,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle, // make the container a circle
                    ),
                    child: RawMaterialButton(
                      onPressed: () {
                        // handle the Facebook button press
                      },
                      shape: const CircleBorder(),
                      child: Image.asset(
                        'assets/images/facebook.png', // insert the Facebook logo image here
                      ), // make the button a circle
                    ),
                  ),
                  Container(
                    width: mWidth / 10,
                    height: mHeight / 10,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle, // make the container a circle
                    ),
                    child: RawMaterialButton(
                      onPressed: () {
                        // handle the Instagram button press
                      },
                      shape: const CircleBorder(),
                      child: Image.asset(
                        'assets/images/insta.png', // insert the Instagram logo image here
                      ), // make the button a circle
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
