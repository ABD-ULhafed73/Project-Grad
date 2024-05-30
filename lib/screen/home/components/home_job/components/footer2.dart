import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class footer2 extends StatelessWidget {
  const footer2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 640,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(kPadding),
          constraints: BoxConstraints(maxWidth: kMaxWidth),
          decoration: BoxDecoration(
            //color: Colors.red,
            image: DecorationImage(
              fit: BoxFit.fill,
              //invertColors: false,
              image: AssetImage("images/footer.jpg"),
            ),
          ),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 300),
                child: Row(
                  children: [
                    Container(
                      constraints: BoxConstraints(maxWidth: kMaxWidth),
                      padding: EdgeInsets.only(left: 80),
                      child: Image.asset(
                        "images/footer3.jpg",
                        //height: 640,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 40),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "خدمات ",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(" اصحاب المواقع",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.right),
                                    Text(
                                        textAlign: TextAlign.right,
                                        "اضف موقعك الى فهرس فرص "),
                                    Text(
                                        textAlign: TextAlign.right,
                                        "اضف وظائف فرص الى موقعك"),
                                    Text(" اصحاب العمل",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.right),
                                    Text(
                                        textAlign: TextAlign.right,
                                        "حزم التوظيف المتكاملة "),
                                    Text(
                                        textAlign: TextAlign.right,
                                        "التوظيف عبر قاعدة بيانات فرص "),
                                    Text("الباحثين عن عمل ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.right),
                                    Text(
                                        textAlign: TextAlign.right,
                                        "انشاء حساب مجاني "),
                                  ],
                                ),
                              ],
                            ),
                            VerticalDivider(
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 80,
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                        //alignment: Alignment.topRight,
                                        padding: EdgeInsets.only(left: 80),
                                        child: Text(
                                          "الروابط",
                                          //textAlign: TextAlign.right,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    Text(
                                      textAlign: TextAlign.right,
                                      "سياسة الخصوصية",
                                    ),
                                    Text("اخلاء المسؤولية",
                                        textAlign: TextAlign.right),
                                    Text(
                                        textAlign: TextAlign.right,
                                        "عن فرص تعز"),
                                    Text(
                                        textAlign: TextAlign.right,
                                        "اتصل بنا "),
                                    Text(
                                      "نماذج الوصف الوظيفي",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      "نماذج سير ذاتية",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            VerticalDivider(
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  // mainAxisAlignment:
                                  // MainAxisAlignment.,
                                  children: [
                                    Container(
                                        // padding:
                                        //     EdgeInsets.only(left: 100),
                                        child: Text(
                                      textAlign: TextAlign.right,
                                      "حول فرص اليمن .كوم",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )),
                                    Text(
                                      textAlign: TextAlign.right,
                                      "  فرص اليمن أكبر محرك بحث عن الوظائف في  اليمن ",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      textAlign: TextAlign.right,
                                      " يجلب لك الوظائف من جميع مواقع التوظيف داخل الجمهورية ",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      "والشركات والصحف في صفحة بحث واحدة",
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    // Container(
                                    //   padding: EdgeInsets.all(13),
                                    //   decoration: BoxDecoration(
                                    //     shape: BoxShape.circle,
                                    //     border: Border.all(
                                    //         // color: Colors.blue,
                                    //         width: 1),
                                    //   ),
                                    //   child: SvgPicture.asset(
                                    //     "assets/icons/footer-bg2.svg",
                                    //     //color: Colors.blue,
                                    //     height: 50,
                                    //     width: 50,
                                    //   ),
                                    // ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              " فرص .كل الحقوق محفوظة ©",
                                              style: TextStyle(fontSize: 10),
                                            ),
                                          ],
                                        ),
                                        Image.asset(
                                          "assets/images/footer2.jpg",
                                          height: 130,
                                          width: 130,
                                        ),
                                      ],
                                    ),
                                    // Image.asset(
                                    //   "assets/images/footer2.jpg",
                                    //   height: 130,
                                    //   width: 130,
                                    // ),
                                  ],
                                ),
                              ],
                            ),
                            VerticalDivider(
                              color: Colors.black,
                            ),
                          ]),
                    ),
                    /////
                  ],
                ),
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        //padding: EdgeInsets.only(top: 100),
                        // margin: EdgeInsets.only(right: 100),
                        child: Text(
                          "فـرص اليمن",
                          style: TextStyle(
                              fontSize: 28.0,
                              fontWeight: FontWeight.w900,
                              color: kSecondaryColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
