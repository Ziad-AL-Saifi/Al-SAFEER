import 'package:alsafier/const_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../List/list_of_questions.dart';
import '../../widget/details_widget.dart';

class Canda_de_Page extends StatelessWidget {
  Canda_de_Page({super.key});
  var dataNameCityGetX = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Types of Canadian Visa'.tr),
        backgroundColor: kColor,
      ),
      body: ListView(
        children: [
          DetailsWidget(
            dataCity: 'Canada Bachelor degree'.tr,
            data: canda_study_bachelordegree,
          ),
          DetailsWidget(
            dataCity: 'Canada Visit Tourism'.tr,
            data: canda_Vist_Tourism,
          ),
          DetailsWidget(
            dataCity: 'Canada The Higher diploma'.tr,
            data: canda_study_higherdiploma,
          ),
          DetailsWidget(
            dataCity: 'Canada Masters degrees'.tr,
            data: canda_study_Masters,
          ),
          DetailsWidget(
            dataCity: 'Canada Study'.tr,
            data: canda_study,
          ),
        ],
      ),
    );
  }
}
