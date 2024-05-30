import 'package:flutter/material.dart';

class searchCandi extends StatelessWidget {
  const searchCandi({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: double.infinity,
      width: MediaQuery.of(context).size.width,
      height: 500,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage("images/jop.png"))),
      child: Container(
        // color: Colors.red,
        //width: double.infinity,
        padding: EdgeInsets.only(top: 100),
        margin: EdgeInsets.only(right: 100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              // margin: EdgeInsets.only(right: 100.0),
              child: Text(
                "البحث عن المرشحين",
                style: TextStyle(fontSize: 60, fontWeight: FontWeight.w800),
              ),
            ),
            Text(
              "يمكنك نشر إعلان وظيفتك من خلال لوحة تحكم بسيطة وسريعة ومتقدمة.",
              style: TextStyle(fontSize: 18),
            ),
            Text(
                "استخدم خدمة البحث عن السير الذاتية وابحث عن الموظفين حسب المهارات أو",
                style: TextStyle(fontSize: 18)),
            Text(
              "المهنة أو المنطقة ، من خلال صفحة بحث سهلة الاستخدام مع خيارات متقدمة.",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              // width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(right: 100),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.end,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)))),
                      child: Text(" انشر وظيفة الان  ",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: Colors.white))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
