import 'package:flutter/material.dart';

import '../../../../../team/account/changepass.dart';
import '../../../../../team/data/showdata.dart';
import '../../../../../team/employ/employer.dart';
import '../../../../../team/folder3/employer2.dart';
import '../../../../../team/steps/jobseekersignup.dart';

class employer extends StatelessWidget {
  employer({
    Key? key,
    required String item,
  }) : super(key: key);

  final _emaillogin = TextEditingController();
  final _passwordlogin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 10,
        ),
        ElevatedButton(
            onPressed: () {
              showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => SimpleDialog(
                        titleTextStyle:
                            TextStyle(fontFamily: 'Cairo', fontSize: 20),
                        title: const Text(
                          'تسجيل الدخول ',
                          textAlign: TextAlign.right,
                        ),
                        children: <Widget>[
                          TextField(
                            controller: _emaillogin,
                            decoration: const InputDecoration(
                              hintText: "ادخل البريد الالكتروني",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                              ),
                            ),
                            onChanged: (value) {},
                          ),
                          const SizedBox(height: 10.0),
                          TextField(
                            controller: _passwordlogin,
                            obscureText: true,
                            decoration: const InputDecoration(
                              hintText: "ادخل كلمة المرور",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                              ),
                            ),
                            onChanged: (value) {},
                          ),
                          const SizedBox(height: 10.0),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            child: const Text("دخول"),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => employer2()),
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 20,
                            width: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: ((context) =>
                                            const forgetpass()),
                                      ));
                                },
                                child: const Text(
                                  'نسيت كلمة المرور؟',
                                ),
                              ),
                              const SizedBox(
                                width: 150,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: ((context) => employe(
                                            item: '',
                                          )),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'ليس لديك حساب؟',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ));
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 240, 241, 243)),
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)))),
            child: Text(" صاحب العمل؟أضف وظيفة  ",
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)))),
      ],
    );
  }
}
