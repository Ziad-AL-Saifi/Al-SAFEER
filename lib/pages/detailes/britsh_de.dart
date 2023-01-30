import 'package:alsafier/const_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../List/list_of_questions.dart';
import '../../widget/details_widget.dart';

class Britsh_de_Page extends StatelessWidget {
  Britsh_de_Page({super.key});
  var dataNameCityGetX = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Types of Britain Visa'.tr),
        backgroundColor: kColor,
      ),
      body: ListView(
        children: [
          DetailsWidget(
            dataCity: 'Britsh Study'.tr,
            data: brtian_Study,
          ),
          DetailsWidget(
            dataCity: 'Britsh Visit'.tr,
            data: brtian_Vist,
          ),
        ],
      ),
    );
  }
}
