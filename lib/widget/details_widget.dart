import 'package:alsafier/List/parsonal_list.dart';
import 'package:alsafier/pages/parsonal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../const_color.dart';
import '../pages/questions.dart';

// ignore: must_be_immutable
class DetailsWidget extends StatelessWidget {
  DetailsWidget({
    Key? key,
    this.dataCity,
    this.data,
  }) : super(key: key);
  String? dataCity;
  List<String>? data = [];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          if (dataCity == "American Visit Tourism".tr ||
              dataCity == "Canada Visit Tourism".tr) {
            Get.to(
              Parsonal(data: data, dataCity: dataCity),
            );
          } else {
            Get.to(
                Questions(
                  data: data,
                ),
                arguments: dataCity);
          }
        },
        child: Card(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 7,
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(
                  color: (Colors.black), offset: Offset(2, 5), blurRadius: 8)
            ], color: kColor, borderRadius: BorderRadius.circular(2)),
            child: Center(
                child: Text(
              dataCity!,
              style: const TextStyle(color: Colors.white, fontSize: 25),
            )),
          ),
        ),
      ),
    );
  }
}
