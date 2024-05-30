// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projectflutter/model.dart/catorgy_model.dart';

import '../../../../constants.dart';
import 'components/Cv_job.dart';
import 'components/catorgy_diff.dart';
import 'components/employer.dart';
import 'components/footer2.dart';
import 'components/jobseeker.dart';
import 'components/jobtoday.dart';
import 'components/searchCandi.dart';
import 'components/search_job.dart';

class Job extends StatefulWidget {
  Job({Key? key}) : super(key: key);
  @override
  _JobState createState() => _JobState();
}

class _JobState extends State<Job> {
  var selectedCountry = "السعودية";
  // final List<String> categories = [
  //   'Technology',
  //   'Marketing',
  //   'Finance',
  //   'Management',
  //   'Sales',
  //   'Customer Service',
  //   'Human Resources',
  //   'Engineering',
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          //width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              DropdownButton(
                underline: Divider(
                  thickness: 0,
                ),
                items: ["اليمن", "السعودية", "الامارات", "الكويت"]
                    .map((e) => DropdownMenuItem(
                          child: Text("$e"),
                          value: e,
                        ))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    selectedCountry = val!;
                  });
                },
                value: selectedCountry,
              ),
              SizedBox(
                height: 20,
                child: VerticalDivider(
                  color: Colors.white,
                ),
              ),
              Text(
                "English",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              // صاحب العمل
              employer(
                item: '',
              ),
              SizedBox(
                width: 20,
              ),
              //حساب الباحث عن عمل
              jobseeker(),
            ],
          ),
        ),
        // actions: <Widget>[],
      ),
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(
            children: [
              search_job(),
              SizedBox(
                height: 50,
              ),
              //وظائف اليوم في تعز
              jobtoday(),

              SizedBox(
                height: 30,
              ),
              //البحث عن مرشحين
              searchCandi(),
              // وظائف متنوعة
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.all(kPadding),
                constraints: BoxConstraints(maxWidth: kMaxWidth),
                width: MediaQuery.of(context).size.width,
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Text(
                    "استكشاف الوظائف حسب الفئة ",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  Text("اختر من القائمة "),
                  SizedBox(
                    height: 15,
                  ),
                  //new create model catorgy
                  GridView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, childAspectRatio: 2.7 / 1.0),
                    itemBuilder: (context, index) => catorgy_job(
                      press: () {},
                      catorgyi: catorgys[index],
                    ),
                    itemCount: catorgys.length,
                  )
                ]),
              ),
              SizedBox(
                height: 30,
              ),
              Divider(),
              Cv_job(),
              SizedBox(
                height: 60,
              ),
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   child: ClipRRect(
              //     child: Image.asset(
              //       "images/footer.jpg",
              //       height: 680,
              //       width: double.infinity,
              //       fit: BoxFit.fill,
              //     ),
              //   ),
              // ),
              // Container(
              //   padding: EdgeInsets.all(kPadding),
              //   constraints: BoxConstraints(maxWidth: kMaxWidth),
              //   width: MediaQuery.of(context).size.width,
              //   child: Row(
              //     children: [
              //       Container(
              //         child: Image.asset("images/footer3.jpg"),
              //       )
              //     ],
              //   ),
              // ),
              footer2(),
              //now we make our website responsive
            ],
          ),
        ),
      ]),
    );
  }
}
