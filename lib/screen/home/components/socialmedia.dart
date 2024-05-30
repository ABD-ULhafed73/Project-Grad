import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class socialMedia extends StatelessWidget {
  const socialMedia({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 27),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(13),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.blue, width: 1),
            ),
            child: SvgPicture.asset(
              "icons/facebook.svg",
              color: Colors.blue,
            ),
          ),
        ),
        SizedBox(
          width: 22,
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(13),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.blue, width: 1),
            ),
            child: SvgPicture.asset(
              "assets/icons/google-plus.svg",
              color: Colors.blue,
              height: 21,
            ),
          ),
        ),
        SizedBox(
          width: 22,
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(13),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.blue, width: 1),
            ),
            child: SvgPicture.asset(
              "assets/icons/twitter.svg",
              height: 21,
              color: Colors.blue,
            ),
          ),
        ),
      ]),
    );
  }
}
