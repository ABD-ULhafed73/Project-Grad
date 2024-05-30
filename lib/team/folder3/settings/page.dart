import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projectflutter/team/folder3/employer2.dart';

class setting extends StatefulWidget {
  const setting({super.key});

  @override
  _settingState createState() => _settingState();
}

class _settingState extends State<setting> {
  final StreamController<bool> _showLoginDataController =
      StreamController<bool>();

  final StreamController<bool> _shoLoginDataController =
      StreamController<bool>();
  final StreamController<bool> _shwLoginDataController =
      StreamController<bool>();
  final StreamController<bool> _sowLoginDataController =
      StreamController<bool>();

  set _selectedGender(Object _selectedGender) {}
  String? _email;
  var genders;

  set _selectedGovernorate(Object _selectedGovernorate) {}
  @override
  void dispose() {
    _showLoginDataController.close();
    super.dispose();
  }

  final List<String> governorate = [
    'عدن',
    'عمران',
    'البيضاء',
    'تعز',
    'حضرموت',
    'لحج',
    'الحديدة',
    'مأرب',
    'صنعاء',
    'ذمار',
    'اب',
    'الجوف',
    'المحويت',
    'ريمة',
    'شبوة',
    'أبين',
    'صعدة',
    'سقطرى',
    'حجة',
    'المهرة',
    'الضالع',
  ];
  final List<String> gender = [
    'شركة',
    'شركة توظيف',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'الإعدادات',
              style: TextStyle(color: Colors.blueGrey, fontSize: 30),
            ),
            Container(
              alignment: Alignment.center,
              height: 260.0,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 68, 188, 243),
                // color: Color.fromARGB(255, 74, 56, 238),
                borderRadius: BorderRadius.all(
                  Radius.circular(25.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      _showLoginDataController.sink.add(true);
                      _shwLoginDataController.sink.add(false);
                      _shoLoginDataController.sink.add(false);
                      _sowLoginDataController.sink.add(false);
                    },
                    child: ListTile(
                        title: Text(
                      'تعديل بيانات  الاتصال',
                      // style: TextStyle(color: Colors.blue),
                    )),
                  ),
                  GestureDetector(
                    onTap: () {
                      _shoLoginDataController.sink.add(true);
                      _showLoginDataController.sink.add(false);
                      _shwLoginDataController.sink.add(false);
                      _sowLoginDataController.sink.add(false);

                      // عرض بيانات تسجيل الدخول إلى الشركة
                    },
                    child: ListTile(
                      title: Text(' تغيير البريد الالكتروني'),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _shoLoginDataController.sink.add(false);
                      _showLoginDataController.sink.add(false);
                      _sowLoginDataController.sink.add(false);

                      _shwLoginDataController.sink.add(true);
                      // عرض بيانات تسجيل الدخول إلى الشركة
                    },
                    child: ListTile(
                      title: Text(' تغيير كلمة المرور '),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _sowLoginDataController.sink.add(true);
                      _showLoginDataController.sink.add(false);
                      _shoLoginDataController.sink.add(false);
                      _shwLoginDataController.sink.add(false);

                      // عرض بيانات تسجيل الدخول إلى الشركة
                    },
                    child: ListTile(
                      title: Text('   إعدادات الإشعار'),
                    ),
                  ),
                ],
              ),
            ),
            StreamBuilder<bool>(
              stream: _showLoginDataController.stream,
              initialData: false,
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                return snapshot.data!
                    ? Container(
                        padding: EdgeInsets.all(16),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Text('تعديل بيانات الاتصال'),
                            TextFormField(
                              style: const TextStyle(fontSize: 16),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                ),
                                labelText: 'الاسم ',
                                labelStyle: const TextStyle(fontSize: 16),
                              ),
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.name,
                              validator: (s) {
                                if (s!.trim().isEmpty) {
                                  return '  يرجاء ادخال الاسم   ';
                                }

                                return null;
                              },
                              //  onSaved: (s) => setState(() => _name = s),
                              // SharedPreferences.getInstance().then((prefs) {
                              // prefs.setString('اسم الشركة', s!);
                              // });
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
                            TextFormField(
                              style: const TextStyle(fontSize: 16),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                ),
                                labelText: 'المسمى الوظيفي  ',
                                labelStyle: const TextStyle(fontSize: 16),
                              ),
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.name,
                              validator: (s) {
                                if (s!.trim().isEmpty) {
                                  return ' المسمى الوظيفي فارغ ';
                                }
                                return null;
                              },
                              //   onSaved: (s) => setState(() => _namep = s),
                            ),
                            TextFormField(
                              style: const TextStyle(fontSize: 16),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                ),
                                labelText: 'العنوان 1 ',
                                labelStyle: const TextStyle(fontSize: 16),
                              ),
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.name,
                              validator: (s) {
                                if (s!.trim().isEmpty) {
                                  return '  يرجاء ادخال  العنوان  ';
                                }

                                return null;
                              },
                            ),
                            TextFormField(
                              style: const TextStyle(fontSize: 16),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                ),
                                labelText: 'العنوان 2 ',
                                labelStyle: const TextStyle(fontSize: 16),
                              ),
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.name,
                              validator: (s) {
                                if (s!.trim().isEmpty) {
                                  return '  يرجاء ادخال  العنوان  ';
                                }

                                return null;
                              },
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right: 8),
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(25.0)),
                                    border: Border.all(
                                        color: Colors.blue.withOpacity(0.2),
                                        width: 0.6),
                                  ),
                                  child: const CountryCodePicker(
                                    onChanged: print,
                                    initialSelection: 'YE',
                                    favorite: ['+967'],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  child: TextFormField(
                                    keyboardType: TextInputType.phone,
                                    maxLength: 10,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                        Icons.phone,
                                        color: Colors.blue,
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 8),
                                      counter: 0.height,
                                      hintText: 'نوع الرقم  ',
                                      helperStyle:
                                          const TextStyle(fontSize: 12),
                                      hintStyle: TextStyle(
                                          color: Colors.black.withOpacity(0.2)),
                                      filled: true,
                                      fillColor: Colors.white,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Colors.black.withOpacity(0.0),
                                            width: 0.6),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(25.0)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(25.0)),
                                        borderSide: BorderSide(
                                            color: Colors.blue.withOpacity(0.0),
                                            width: 0.6),
                                      ),
                                      labelText: 'رقم الهاتف',
                                      labelStyle:
                                          const TextStyle(color: Colors.black),
                                    ),
                                    validator: (s) {
                                      if (s!.isEmpty) {
                                        return 'يرجى إدخال رقم الهاتف';
                                      } else if (s.length < 8) {
                                        return 'يجب أن يتكون رقم الهاتف من ٩ أرقام  ';
                                      } else if (!s.startsWith('7')) {
                                        return 'يجب أن يبدأ رقم الهاتف بالرقم 7';
                                      }
                                      return null;
                                    },
                                  ),
                                ).expand(),
                              ],
                            ),
                            10.height,
                            DropdownButtonFormField(
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: const BorderSide(
                                      width: 1, color: Colors.black87),
                                ),
                                labelText: 'المحافظة',
                                labelStyle: const TextStyle(fontSize: 16),
                              ),
                              items: governorate.map((governorate) {
                                return DropdownMenuItem(
                                  value: governorate,
                                  child: Text(governorate),
                                );
                              }).toList(),
                              validator: (s) {
                                if (s!.isEmpty) {
                                  return 'يرجاء ادخال المحافظه ';
                                } else if (!s.isNotEmpty) {
                                  return null;
                                }
                              },
                              onChanged: (value) {
                                setState(() {
                                  _selectedGovernorate = value!;
                                });
                              },
                              onSaved: (value) {
                                setState(() {
                                  _selectedGovernorate = value!;
                                });
                              },
                            ),
                            const SizedBox(height: 16.0),
                            DropdownButtonFormField(
                              //  isDense: true,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: const BorderSide(
                                      width: 1, color: Colors.black87),
                                ),
                                labelText: 'نوع المعلن',
                                labelStyle: const TextStyle(fontSize: 16),
                              ),
                              items: gender.map((gender) {
                                return DropdownMenuItem(
                                  value: gender,
                                  child: Text(gender),
                                );
                              }).toList(),

                              onChanged: (value) {
                                setState(
                                  () {
                                    _selectedGender = value!;
                                  },
                                );
                              },
                              onSaved: (value) {
                                setState(() {
                                  _selectedGender = value!;
                                });
                              },
                            ),
                            ElevatedButton(
                              child: const Text('تحديث بيانات الاتصال '),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => employer2()));
                              },
                            ),
                          ],
                        ),
                      )
                    : Container();
              },
            ),
            StreamBuilder<bool>(
              stream: _shoLoginDataController.stream,
              initialData: false,
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                return snapshot.data!
                    ? Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            TextFormField(
                              style: const TextStyle(fontSize: 16),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                ),
                                labelText: 'كلمة المرور الحالية  ',
                                labelStyle: const TextStyle(fontSize: 16),
                              ),
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.name,
                              validator: (s) {
                                if (s!.trim().isEmpty) {
                                  return '  يرجاء ادخال  كلمة المرور  ';
                                }

                                return null;
                              },
                            ),
                            const SizedBox(height: 16.0),
                            TextFormField(
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  // ignore: prefer_const_constructors
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: const BorderSide(
                                      width: 1,
                                      color: Color.fromARGB(221, 0, 0, 0)),
                                ),
                                labelText: 'البريد الإلكتروني',
                                labelStyle: const TextStyle(fontSize: 16),
                              ),
                              validator: (s) {
                                if (s!.contains('@gmail.com')) {
                                  return 'ادخل بريد الكتروني صالح';
                                }
                                if (s.isEmpty) {
                                  return 'يرجاء ادخال البريد الالكتروني';
                                }

                                return null;
                              },
                              onChanged: (value) {
                                setState(
                                  () {
                                    _email = value;
                                  },
                                );
                              },
                              onSaved: (value) {
                                setState(() {
                                  _email = value!;
                                });
                              },
                            ),
                            const SizedBox(height: 16.0),
                            ElevatedButton(
                              child: const Text(' تغيير البريد الالكتروني'),
                              onPressed: () {
                                //   _formKey.currentState?.save();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => employer2()));
                              },
                            ),
                          ],
                        ),
                      )
                    : Container();
              },
            ),
            StreamBuilder<bool>(
              stream: _shwLoginDataController.stream,
              initialData: false,
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                return snapshot.data!
                    ? Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Text('تغيير كلمة المرور',
                                style: boldTextStyle(size: 18)),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 8),
                                hintText: ' راجع بريدك الالكتروني',
                                helperStyle: const TextStyle(fontSize: 12),
                                hintStyle: TextStyle(
                                    color: Colors.blue.withOpacity(0.2)),
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue.withOpacity(0.2),
                                      width: 0.6),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0)),
                                  borderSide: BorderSide(
                                      color: Colors.blue.withOpacity(0.2),
                                      width: 0.6),
                                ),
                                labelText: '  كلمة المرور الحالية',
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 8),
                                hintText: ' ',
                                helperStyle: const TextStyle(fontSize: 12),
                                hintStyle: TextStyle(
                                    color: Colors.blue.withOpacity(0.2)),
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue.withOpacity(0.2),
                                      width: 0.6),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0)),
                                  borderSide: BorderSide(
                                      color: Colors.blue.withOpacity(0.2),
                                      width: 0.6),
                                ),
                                labelText: ' كلمة المرور الجديدة ',
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: const Icon(Icons.remove_red_eye),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 8),
                                  hintText: ' ',
                                  helperStyle: const TextStyle(fontSize: 12),
                                  hintStyle: TextStyle(
                                      color: Colors.blue.withOpacity(0.2)),
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue.withOpacity(0.2),
                                        width: 0.6),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10.0)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10.0)),
                                    borderSide: BorderSide(
                                        color: Colors.blue.withOpacity(0.2),
                                        width: 0.6),
                                  ),
                                  labelText: ' تاكيد كلمة المرور',
                                  prefixIcon: const Icon(Icons.lock),
                                  suffixIcon: const Icon(Icons.remove_red_eye)),
                            ),
                            Theme(
                                data: ThemeData.light(),
                                child: MaterialButton(
                                  color:
                                      const Color.fromARGB(255, 67, 107, 153),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => employer2()),
                                    );
                                  },
                                  child: const Text('تغيير كلمة المرور'),
                                )),
                          ],
                        ),
                      )
                    : Container();
              },
            ),
            StreamBuilder<bool>(
              stream: _sowLoginDataController.stream,
              initialData: false,
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                return snapshot.data!
                    ? Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              alignment: Alignment.topLeft,
                              child: Text(
                                'هل تريد استلام رسائل بريدية لاعلامك باخر الوظائف المناسبة لك ؟',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ),
                            Wrap(
                              alignment: WrapAlignment.center,
                              direction: Axis.horizontal,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Theme(
                                  data: Theme.of(context).copyWith(
                                      unselectedWidgetColor: Colors.black),
                                  child: Radio(
                                    //value: [genders],
                                    value: 'فورا',
                                    groupValue: genders,
                                    onChanged: ((value) {
                                      setState(() {
                                        genders = value;
                                      });
                                      Text('فورا');
                                    }),
                                  ),
                                ),
                                Theme(
                                  data: Theme.of(context).copyWith(
                                      unselectedWidgetColor: Colors.black),
                                  child: Radio(
                                    // value: [genders],
                                    value: 'ملخص يومي',
                                    groupValue: genders,
                                    onChanged: ((value) {
                                      setState(() {
                                        genders = value;
                                      });
                                      Text('ملخص يومي');
                                    }),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
