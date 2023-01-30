import 'package:flutter/material.dart';

import '../const_color.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        const TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your three-syllable name ')),
        const SizedBox(
          height: 10,
        ),
        const TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Phone Number')),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: const BoxDecoration(color: kColor),
            child: const Center(
                child: Text(
              'Submit',
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
          ),
        )
      ],
    );
  }
}
