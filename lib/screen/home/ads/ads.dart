//import 'dart:html';

import 'package:flutter/material.dart';

class AdsBunner extends StatelessWidget {
  const AdsBunner({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            height: 300,
            width: 500,
            color: Colors.black87,
            alignment: Alignment.center,
            child: const Text(
              "مساحة اعلانات ",
              style: TextStyle(
                  color: Colors.white, fontSize: 40, fontFamily: 'Black'),
            ),
          ),
        ),
      ],
    );
  }
}
