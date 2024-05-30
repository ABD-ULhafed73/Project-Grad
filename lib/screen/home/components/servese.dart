import 'package:flutter/material.dart';

import '../../../constants.dart';

class service extends StatelessWidget {
  const service({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      // padding: EdgeInsets.all(kPadding),
      //constraints: BoxConstraints(maxWidth: kMaxWidth),
      child: Row(children: [
        Container(
          // width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
              color: Color(0xFFe1eaf1),
              borderRadius: BorderRadius.circular(16)),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: Image.asset("images/image2.jpg",
                          height: 80, width: 80, fit: BoxFit.fill)),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "المشهد اليمني ",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16),
                      ),
                      Text("قناة اخبارية تهتم بالشأن اليمني "),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        //Spacer(),
        SizedBox(
          width: 50,
        ),
        Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
            //padding: EdgeInsets.all(20),
            padding: EdgeInsets.all(14),
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                // color: Color(0xFFe1eaf1),
                borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset("images/image3.jpg",
                            height: 80, width: 80, fit: BoxFit.fill)),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "يمن تك ",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 16),
                        ),
                        Text("قناة اخبارية تهتم بالشأن اليمني "),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        // Spacer(),
        SizedBox(width: 30),
        Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
            padding: EdgeInsets.all(13),
            margin: EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
                //color: Color(0xFFe1eaf1),
                borderRadius: BorderRadius.circular(16)),
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset("images/image2.jpg",
                            height: 80, width: 80, fit: BoxFit.fill)),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "يمن تك ",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 16),
                        ),
                        Text("قناة اخبارية تهتم بالشأن اليمني "),
                      ],
                    ),
                  ])
                ]),
          ),
        ),
        //Spacer(),
        SizedBox(
          width: 30,
        ),
        Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
            padding: EdgeInsets.all(14),
            margin: EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
                //color: Color(0xFFe1eaf1),
                borderRadius: BorderRadius.circular(16)),
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset("images/image2.jpg",
                            height: 80, width: 80, fit: BoxFit.fill)),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "يمن تك ",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 16),
                        ),
                        Text("قناة اخبارية تهتم بالشأن اليمني "),
                      ],
                    ),
                  ])
                ]),
          ),
        ),
        //Spacer(),
      ]),
    );
  }
}
