import 'package:flutter/material.dart';

import 'firstStep.dart';

class DisplayFormDataScreen extends StatelessWidget {
  final String degree;
  final String nameOfCollege;
  final String department;
  final int yearOfGraduation;
  final String grade;

  const DisplayFormDataScreen({
    required this.degree,
    required this.nameOfCollege,
    required this.department,
    required this.yearOfGraduation,
    required this.grade,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //
        title: const Text(' المؤهلات الوظيفية'),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 40),
        padding: const EdgeInsets.only(top: 60),
        //alignment: Alignment.bottomRight,

        decoration: BoxDecoration(
            border: Border.all(width: 1.5, color: Colors.black),
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(25.0)),
            boxShadow: [
              BoxShadow(
                offset: Offset(15, 15),
                color: Colors.white24,
                blurRadius: 10,
              )
            ]),

        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return ListTile(
                  title: const Text('الدرجة العلمية:'),
                  trailing: Text(degree),
                );
              case 1:
                return ListTile(
                  title: const Text('اسم الكلية/الجامعة/المعهد:'),
                  trailing: Text(nameOfCollege),
                );
              case 2:
                return ListTile(
                  title: const Text('مجال العمل:'),
                  trailing: Text(department),
                );
              case 3:
                return ListTile(
                  title: const Text('سنة التخرج:'),
                  trailing: Text(yearOfGraduation.toString()),
                );
              case 4:
                return ListTile(
                  title: const Text('التقدير:'),
                  trailing: Text(grade),
                );
              default:
                return null;
            }
          },
        ),
      ),
    );
  }
}
