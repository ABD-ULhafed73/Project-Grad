import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;

import '../../Personal_Data/brief.dart';
import 'dialogcv.dart';

class ReForm extends StatefulWidget {
  final String user;
  final String emp;
  final String namejob;
  final String des;
  final String phon;
  final String sal;
  final String exp;
  final String prov2;

  ReForm({
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
  _ReFormState createState() => _ReFormState();
}

class _ReFormState extends State<ReForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Confirmation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 40),
                padding: const EdgeInsets.only(top: 60),
                //alignment: Alignment.bottomRight,
                decoration: BoxDecoration(
                  border: Border.all(width: 3, color: Colors.black),
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      widget.user,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(widget.namejob),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(widget.des),
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
                decoration: BoxDecoration(
                  border: Border.all(width: 1.5, color: Colors.black),
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: Offset(0.0, 10.0)),
                  ],
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
                      '!لم يتم رفع السيرة الذاتية بعد, ارفع الان ',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              title: const Text(
                                'ملفات السيرة الذاتية المحملة',
                                style: TextStyle(fontSize: 25),
                              ),
                              content: Container(
                                height: 300,
                                width: 300,
                                child: insertcv(),
                              ),
                              actions: [
                                const SizedBox(
                                  width: 110,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('إغلاق'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.upload_file),
                      label: const Text('تحميل سيرتك الذاتية'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.only(top: 40),
                padding: const EdgeInsets.only(top: 60),
                //alignment: Alignment.bottomRight,
                decoration: BoxDecoration(
                  border: Border.all(width: 3, color: Colors.black),
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: Offset(0.0, 10.0)),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      ' 🌎نبذة مختصرة',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      width: 90.0,
                    ),
                    // ignore: avoid_unnecessary_containers
                    Container(
                      child: TextButton.icon(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text(
                                    '  تعديل: نبذة مختصرة',
                                    style: TextStyle(fontSize: 25),
                                  ),
                                  content: const dialogbrief(),
                                  actions: [
                                    const SizedBox(
                                      width: 110,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('إغلاق'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.pin_invoke,
                          ),
                          label: const Text(
                            'تعديل',
                            style: TextStyle(
                              color: Colors.purple,
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 40),
                padding: const EdgeInsets.only(top: 60),
                //alignment: Alignment.bottomRight,
                decoration: BoxDecoration(
                  border: Border.all(width: 3, color: Colors.black),
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: Offset(0.0, 10.0)),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      widget.user,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(widget.namejob),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(widget.des),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.only(top: 40),
                padding: const EdgeInsets.only(top: 60),
                //alignment: Alignment.bottomRight,
                decoration: BoxDecoration(
                  border: Border.all(width: 3, color: Colors.black),
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: Offset(0.0, 10.0)),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.only(top: 40),
                padding: const EdgeInsets.only(top: 60),
                //alignment: Alignment.bottomRight,
                decoration: BoxDecoration(
                  border: Border.all(width: 3, color: Colors.black),
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: Offset(0.0, 10.0)),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.only(top: 40),
                padding: const EdgeInsets.only(top: 60),
                //alignment: Alignment.bottomRight,
                decoration: BoxDecoration(
                  border: Border.all(width: 3, color: Colors.black),
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: Offset(0.0, 10.0)),
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
