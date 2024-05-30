import 'package:flutter/material.dart';

import '../../../constants.dart';

import '../../../model.dart/catorgy_model.dart';
import 'home_job/components/catorgy_diff.dart';
import 'home_job/screenhome_job.dart';

class HeaderWebMenu extends StatelessWidget {
  const HeaderWebMenu({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // HeaderMenu(
        //   press: () {
        //     // Navigator.pushNamed(context,
        //     //("/jobtoday");
        //     //Job();
        //   },
        //   title: "منح مجانية ",
        // ),
        // SizedBox(
        //   width: kPadding,
        // ),
        // HeaderMenu(
        //   press: () {},
        //   title: "جامعات ",
        // ),
        // SizedBox(
        //   width: kPadding,
        // ),
        HeaderMenu(
          press: () {
            /*  Navigator.push(
                context, MaterialPageRoute(builder: (context) => Job())); */
          },
          title: "معاهد",
        ),
        SizedBox(
          width: kPadding,
        ),
        HeaderMenu(
          press: () {},
          title: "المفقودات",
        ),
        SizedBox(
          width: kPadding,
        ),
        HeaderMenu(
          press: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => catorgy_job(
            //               press: () {
            //                 "وظائف متنوعة";
            //               },
            //               catorgyi: catorgy[])));
          },
          title: "وظائف متنوعة",
        ),
        SizedBox(
          width: kPadding,
        ),
        HeaderMenu(
          press: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Job()));
          },
          title: "وظائف اليوم",
        ),
        SizedBox(
          width: kPadding,
        ),
        HeaderMenu(
          press: () {},
          title: "الرئيسية ",
        ),
      ],
    );
  }
}

class HeaderMenu extends StatelessWidget {
  const HeaderMenu({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);
  final String title;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        child: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ),
    );
  }
}
