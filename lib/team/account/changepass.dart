// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'changepass1.dart';

class forgetpass extends StatefulWidget {
  const forgetpass({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _forgetpassState createState() => _forgetpassState();
}

class _forgetpassState extends State<forgetpass> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Dialog(
          child: Column(
            children: [
              Stack(
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: Text('عوده', style: boldTextStyle(size: 14))
                          .onTap(() {
                        finish(context);
                      }).paddingOnly(right: 8, top: 8)),
                ],
              ),
              Column(
                children: [
                  Text('نسيت كلمة المرور', style: boldTextStyle(size: 18)),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      hintText: 'البريد الالكتروني',
                      helperStyle: const TextStyle(fontSize: 12),
                      hintStyle: TextStyle(color: Colors.blue.withOpacity(0.2)),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      labelText: 'عنوان البريد الالكتروني',
                    ),
                  ).paddingOnly(top: 16, bottom: 16),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const pass1()));
                      },
                      child: const Text('إرسال')),
                  16.height,
                  AppButton(
                    width: context.width(),
                  ).paddingOnly(left: 16, right: 16, bottom: 16),
                ],
              ).paddingAll(0),
            ],
          ),
        ),
      ),
    );
  }
}
