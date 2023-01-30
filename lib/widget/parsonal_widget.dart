import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ParsonalWidget extends StatelessWidget {
  ParsonalWidget({required this.ques, required this.hintText});
  String hintText;
  String ques;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text(ques),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: hintText,
              label: Text("Required"),
              border: OutlineInputBorder(),
            ),
          ),
        )
      ]),
    );
  }
}
