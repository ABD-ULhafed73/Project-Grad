import 'package:flutter/material.dart';

class Cv_job extends StatelessWidget {
  const Cv_job({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: MediaQuery.of(context).size.width,
      // padding: EdgeInsets.all(kPadding),
      //constraints: BoxConstraints(maxWidth: kMaxWidth),
      // width: 300,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: (Image.asset(
                        "images/search_jobs.jpg",
                        height: 590,
                        width: 650,
                        fit: BoxFit.fill,
                      )),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "تبحث عن وظيفة",
                      style:
                          TextStyle(fontSize: 60, fontWeight: FontWeight.w800),
                    ),
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
                        child: Text(" حمل سيرتك الذاتية ",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: Colors.white))),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
