//import 'dart:ffi';

// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//import 'package:projectflutter/constants.dart';

//import '../../constants.dart';
import '../../constants.dart';
import '../../model.dart/responsive.dart';
import 'components/header_container.dart';
import 'components/servese.dart';
import 'components/socialmedia.dart';
import 'footer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // scrollDirection: Axis.vertical,
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HeaderContainer(),
            /* Expanded(
                  flex: 1, */

            Container(
              // color: Colors.red,
              padding:
                  EdgeInsets.only(left: 100, top: 25, right: 25, bottom: 25),
              child: Center(
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "الاكثر زيارة ",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          "الاخبار العامة ",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        // color: Colors.blue,
                        margin: EdgeInsets.only(right: 450),
                      )
                    ],
                  ),
                ]),
              ),
            ),
            SizedBox(
              height: 10,
            ),

            service(),
            SizedBox(
              height: 10,
            ),

            Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(children: [
                    service(),
                  ]),
                ]),
            SizedBox(height: 10),
            Row(
              children: [
                Column(
                  children: [
                    service(),
                  ],
                )
              ],
            ),
//بداية فورم تسجيل الدخول
            Divider(),
            SizedBox(
              height: 6,
            ),
            socialMedia(),
            Divider(),
            //if (Responsive.isDesktop(context))
            Filter()
          ],
        ),
      ),
    );
  }
}
