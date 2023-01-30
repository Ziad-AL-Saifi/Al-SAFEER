import 'package:flutter/material.dart';

import '../const_color.dart';

// ignore: must_be_immutable
class CityImageText extends StatelessWidget {
  CityImageText({super.key, this.image, this.name, this.onTap});
  String? image;
  String? name;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                    color: (kColor), offset: Offset(0, 10), blurRadius: 50),
              ]),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 5.5,
                child: Image.asset(
                  image!,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  name!,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold, color: kColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
