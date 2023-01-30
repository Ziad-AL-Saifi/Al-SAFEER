import 'package:alsafier/pages/questions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../List/list_of_city.dart';
import '../List/list_of_questions.dart';
import '../const_color.dart';
import '../widget/city_image_text.dart';
import '../widget/drawer.dart';
import '../widget/kit.dart';
import 'detailes/amrica_da.dart';
import 'detailes/britsh_de.dart';
import 'detailes/canda_de.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> dataCity = ['Select the City'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: kColor,
        title: Text(
          'ALSAFIRE'.tr,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(children: [
        KitWidget(),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            "The Countries".tr,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: kColor),
          ),
        ),
        Expanded(
            child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          children: [
            CityImageText(
              image: 'assets/images/amerca.jpg',
              name: 'America'.tr,
              onTap: () {
                Get.to(
                  Am_de_Page(),
                );
                setState(() {});
              },
            ),
            CityImageText(
              image: 'assets/images/brtian.webp',
              name: 'Britsh'.tr,
              onTap: () {
                Get.to(
                  Britsh_de_Page(),
                );
                setState(() {});
              },
            ),
            CityImageText(
              image: 'assets/images/canda.jpeg',
              name: 'Canada'.tr,
              onTap: () {
                Get.to(
                  Canda_de_Page(),
                );
                setState(() {});
              },
            ),
            CityImageText(
              image: 'assets/images/Schengen.jpg',
              name: 'Schengen'.tr,
              onTap: () {
                Get.to(Questions(
                  data: brtian_Vist,
                ));
                dataCity = detailse_Schengen;
                setState(() {});
              },
            ),
          ],
        )),
      ]),
      drawer: const DrawerWid(),
    );
  }
}
