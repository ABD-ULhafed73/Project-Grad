// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class search_job extends StatelessWidget {
  const search_job({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 670,
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage("images/joop.jpg"),
      )),
      child: Container(
        padding: EdgeInsets.all(kPadding),
        // constraints: BoxConstraints(maxWidth: kMaxWidth),
        // margin: EdgeInsets.only(top: 200, right: 250),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 200, right: 250),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "وظائف في اليمن",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 252, 252)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 300,
                    ),
                    padding: EdgeInsets.all(5),
                    height: 50,
                    //width: 500,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      /* border: Border.all(
                              color: Colors.grey.withOpacity(0.3)) */
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: TextFormField(
                      textAlign: TextAlign.right,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                          prefixIcon: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.blue),
                            child: Icon(
                              Icons.search,
                              color: Color.fromARGB(255, 255, 253, 253),
                            ),
                          ),
                          //suffix: Text("المسمى الوظيفي "),
                          hintText:
                              "المسمى الوظيفي ,الشركة او الكلمات الرئيسية ",
                          hintStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          focusedBorder:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide.none)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      //color: Colors.red,
                      alignment: Alignment.centerRight,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                MaterialButton(
                                  textColor: Colors.white,
                                  splashColor: Colors.white,
                                  onPressed: () {},
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                              padding: EdgeInsets.only(top: 30),
                                              //margin: EdgeInsets.only(left: 200),
                                              child: Text(
                                                "صاحب العمل ",
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                          Text(
                                            '''وظف افضل المواهب للمتقدمين
                                        المرشحين للوظيفة''',
                                            style: TextStyle(fontSize: 12),
                                            textAlign: TextAlign.right,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.arrow_back,
                                                size: 17,
                                              ),
                                              Text(
                                                " انشر وظيفة",
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      Icon(
                                        Icons.library_add,
                                        size: 60,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 150,
                                ),
                                MaterialButton(
                                  /* style: TextButton.styleFrom(
                                      foregroundColor: Colors.white), */
                                  textColor: Colors.white,
                                  splashColor: Colors.white,
                                  onPressed: () {},
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                              padding: EdgeInsets.only(top: 30),
                                              //margin: EdgeInsets.only(left: 200),
                                              child: Text(
                                                " باحث عن وظيفة ",
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                          Text(
                                            '''انظم الى فرص تعز واسمح بالعثور على 
                                            الوظيفة بسهولة''',
                                            style: TextStyle(fontSize: 12),
                                            textAlign: TextAlign.right,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.arrow_back,
                                                size: 17,
                                              ),
                                              Text(
                                                "بناء ملف التعريف الخاص بك ",
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      Icon(
                                        Icons.switch_account,
                                        size: 60,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
