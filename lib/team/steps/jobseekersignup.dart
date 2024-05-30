import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:projectflutter/team/data/page22data.dart';
import 'package:projectflutter/team/data/page33.dart';
import 'package:libphonenumber/libphonenumber.dart';
import 'package:projectflutter/team/steps/page22data.dart';

import 'keyInformation.dart';

class jobseekersignup extends StatefulWidget {
  const jobseekersignup({Key? key, required String item});

  @override
  _jobseekersignupState createState() => _jobseekersignupState();
}

class _jobseekersignupState extends State<jobseekersignup> {
  final _formKey = GlobalKey<FormState>();
  var autoValidate = false;

  final _usernameCont = TextEditingController();
  final _emailCont = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _namejob2Cont = TextEditingController();
  final _passwordCont = TextEditingController();

  final TextEditingController _dateCont = TextEditingController();
  final _dateFormatCont = DateFormat('dd/MM/yyyy');

  var usernameFocus = FocusNode();
  var email2Fdcus = FocusNode();
  var phoneFocus = FocusNode();
  var namejob2Focus = FocusNode();
  var password2Focus = FocusNode();

  @override
  void dispose() {
    _usernameCont.dispose();
    _emailCont.dispose();
    _phoneNumberController.dispose();
    _namejob2Cont.dispose();
    _passwordCont.dispose();
    _dateCont.dispose();
    usernameFocus.dispose();
    email2Fdcus.dispose();
    phoneFocus.dispose();
    namejob2Focus.dispose();
    password2Focus.dispose();
    super.dispose();
  }

  void _submit22() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => keyInformation(
            item: '',
          ),
        ),
      );
    }
  }

  String? _name2;
  String? _email2;
  String? _phoneNumberError;
  String? _selectedjobTitle2;
  String? _password2;
//String? _phoneNumberError;
  CountryCode? _selectedCode;

  final List<String> _provinc = [
    'تعز',
    'صنعاء',
    'حضرموت',
    'مأرب',
    'لحج',
    'عمران',
    'ذمار',
    'الجوف',
    'الحديدة',
    'البيضاء',
    'أبين',
    'إب',
    'صعدة',
    'الضالع',
    'حجة',
    'المهرة',
    'شبوة',
    'ريمة',
    'عدن ',
    'حجة',
    'سقطرى',
    'المحويت'
  ];

  final List<String> employmentstatus = [
    'ابحث عن وظيفة',
    'اعمل وابحث عنوظيفة',
    'لا ابحث عن وظيفة',
  ];
  final List<String> profileprivacy = [
    'عام.اي مستحدم يستطيع ان يعرض ملفي الشخصي',
    'فقط اصحاب العمل المسجلين يمكنهم عرض ملفي الشخصي',
    'مخفي. يظهر فقط لمن عن الوظيفة الخاصة به',
  ];
  final List<String> gender = [
    'ذكر',
    'أنثى',
    'غير محدد',
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/next');
              },
              icon: Icon(
                Icons.arrow_forward,
                color: Colors.black,
              ),
            ),
          ],
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    controller: _usernameCont,
                    focusNode: usernameFocus,
                    style: const TextStyle(fontSize: 16),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      labelText: 'الاسم كاملا',
                      labelStyle: TextStyle(fontSize: 16),
                    ),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.name,
                    validator: (s) {
                      if (s!.trim().isEmpty) {
                        return '  يرجاء ادخال الاسم   ';
                      }

                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        _name2 = value!;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _emailCont,
                    focusNode: email2Fdcus,
                    style: const TextStyle(fontSize: 16),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email, color: Colors.blue),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      labelText: 'البريد الالكتروني ',
                      labelStyle: TextStyle(fontSize: 16),
                    ),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.emailAddress,
                    validator: (s) {
                      if (s!.trim().contains('@gmail.com')) {
                        return null;
                      }
                      if (s.trim().isEmpty) {
                        return 'يرجاء إدخال البريد الالكتروني  ';
                      }

                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        _email2 = value!;
                      });
                    },
                    //    onSaved: (s) => setState(() => _email = s),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _phoneNumberController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      labelText: 'رقم الهاتف',
                      labelStyle: const TextStyle(color: Colors.black),
                      prefixIcon: CountryCodePicker(
                        onChanged: (countryCode) {
                          setState(() {
                            _selectedCode = countryCode;
                          });
                        },
                        // other properties for customization
                      ),
                      hintText: 'رقم الهاتف',
                      errorText: _phoneNumberError,
                      // other input decoration properties
                    ),
                    validator: (value) {
                      if (_phoneNumberError != null) {
                        return _phoneNumberError!;
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {});
                    },
                    // other text form field properties
                  ),
                  TextFormField(
                    controller: _namejob2Cont,
                    focusNode: namejob2Focus,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      labelText: 'المسمى الوظيفي',
                      labelStyle: TextStyle(fontSize: 16),
                    ),
                    validator: (s) {
                      if (s!.isEmpty) {
                        return 'يرجاء ادخال المسمى الوظيفي';
                      } else if (s.isNotEmpty) {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      setState(() {
                        _selectedjobTitle2 = value;
                      });
                    },
                    onSaved: (value) {
                      setState(() {
                        _selectedjobTitle2 = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    controller: _passwordCont,
                    focusNode: password2Focus,
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
                    validator: (s) {
                      if (s!.isEmpty) {
                        return 'يرجاء ادخال  كلمة المرور';
                      } else if (s.isNotEmpty) {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      setState(() {
                        _password2 = value;
                      });
                    },
                    onSaved: (value) {
                      setState(() {
                        _password2 = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 10.0),
                  ElevatedButton(
                    child: const Text("تسجيل"),
                    onPressed: _submit22,
                  ),
                ],
              ),
            ),
          ),
        )));
  }
}
