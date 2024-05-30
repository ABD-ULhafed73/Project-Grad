import 'package:flutter/material.dart';

import '../../../../../model.dart/catorgy_model.dart';

class catorgy_job extends StatelessWidget {
  const catorgy_job({
    Key? key,
    required this.catorgyi,
    required this.press,
  }) : super(key: key);
  final catorgy catorgyi;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: InkWell(
              onTap: press,
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  // padding: EdgeInsets.all(0.0),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MaterialButton(
                          splashColor: Colors.blue,
                          onPressed: () {},
                          child: Row(
                            children: [
                              Container(
                                width: 150,
                                margin: EdgeInsets.only(bottom: 15),
                                child: Column(
                                  children: [
                                    Text(
                                      catorgyi.title,
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      catorgyi.Text,
                                      style: TextStyle(fontSize: 11),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.asset(
                                  catorgyi.image,
                                  height: 90,
                                  width: 90,
                                  fit: BoxFit.cover,
                                ),
                              )
                            ],
                          ),
                        )
                      ]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
