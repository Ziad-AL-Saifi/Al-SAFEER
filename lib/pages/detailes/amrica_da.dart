import 'package:alsafier/const_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../List/list_of_questions.dart';
import '../../widget/details_widget.dart';

class Am_de_Page extends StatelessWidget {
  Am_de_Page({super.key});

  var cityName = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Types of American Visa'.tr),
        backgroundColor: kColor,
      ),
      body: ListView(
        children: [
          DetailsWidget(
            dataCity: 'American Study'.tr,
            data: america_Study_f1,
          ),
          DetailsWidget(
            dataCity: "American Visit Tourism".tr,
            data: america_Vist_Tourism,
          ),
          DetailsWidget(
            dataCity: 'American Masters'.tr,
            data: america_study_Masters,
          ),
          DetailsWidget(
            dataCity: 'American Bachelor degree'.tr,
            data: america_study_bachelordegree,
          )
        ],
      ),
    );
  }
}
