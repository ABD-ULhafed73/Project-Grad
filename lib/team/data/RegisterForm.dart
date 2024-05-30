/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dialogcv.dart';

class regForm extends StatelessWidget {
  final String user;
  final String emp;
  final String namejob;
  final String des;
  final String phon;
  final String sal;
  final String exp;
  final String prov2;
  regForm({
    required this.user,
    required this.emp,
    required this.namejob,
    required this.des,
    required this.phon,
    required this.sal,
    required this.exp,
    required this.prov2,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Confirmation'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 50),
                padding: const EdgeInsets.only(top: 60),
                alignment: Alignment.topCenter,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 81, 94, 165),
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '$user',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text('$namejob'),
                    const SizedBox(
                      height: 8,
                    ),
                    Text('$des')
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                margin: const EdgeInsets.only(top: 40),
                padding: const EdgeInsets.only(top: 60),
                //alignment: Alignment.bottomRight,
                decoration: const BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'ملفات السيرة الذاتية المحملة',
                      style: TextStyle(fontSize: 25),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'لم يتم رفع السيرة الذاتية بعد, ارفع الان !',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ElevatedButton.icon(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll<Color>(Colors.grey)),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => cccv()));
                      },
                      icon: const Icon(Icons.arrow_upward_outlined),
                      label: const Text("أضف جديد"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.only(top: 50),
                padding: const EdgeInsets.only(top: 60),
                alignment: Alignment.topCenter,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 81, 94, 165),
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '$user',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text('$namejob'),
                    const SizedBox(
                      height: 8,
                    ),
                    Text('$des')
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/