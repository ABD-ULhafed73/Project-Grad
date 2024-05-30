import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
import 'employer1.dart';

// ignore: camel_case_types
class employe extends StatefulWidget {
  static String tag = '/employer';

  const employe({
    super.key,
    required String item,
  });

  @override
  employeState createState() => employeState();
}

class employeState extends State<employe> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late SearchBar searchBar;

  final GlobalKey<FormFieldState<String>> _passwordFieldKey =
      GlobalKey<FormFieldState<String>>();

  init() async {}
  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  var autoValidate = false;

  late String _governorate;

  var usernameCont = TextEditingController();
  var personCont = TextEditingController();
  var emailCont = TextEditingController();
  final _phoneNumberController = TextEditingController();
  var addressCont = TextEditingController();
  var provinceCont = TextEditingController();
  final _governoratesController = TextEditingController();

  var usernameFocus = FocusNode();
  var personFocus = FocusNode();
  var emailFocus = FocusNode();
  var phoneFocus = FocusNode();
  var addressFocus = FocusNode();
  var provinceFoucus = FocusNode();

  @override
  void dispose() {
    usernameCont.dispose();
    personCont.dispose();
    emailCont.dispose();
    _phoneNumberController.dispose();
    provinceCont.dispose();
    addressCont.dispose();

    super.dispose();
  }

  void _EMPLOYERsubmit() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => employer1(
            name: usernameCont.text,
            namep: personCont.text,
            phoneNumber: _phoneNumberController.text,
            email: emailCont.text,
            address: addressCont.text,
            governorate: _governorate,
          ),
        ),
      );
    }
  }

  String? _phoneNumberError;
  CountryCode? _selectedCode;
  List<String> governorates = [
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
    'الضالع'
  ];
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '',
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              //  key: scaffoldkey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: [
                  TextFormField(
                    controller: usernameCont,
                    focusNode: usernameFocus,
                    style: const TextStyle(fontSize: 16),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.foundation_rounded,
                        color: Colors.blue,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      labelText: 'اسم الشركة',
                      labelStyle: TextStyle(fontSize: 16),
                    ),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.name,
                    validator: (s) {
                      if (s!.trim().isEmpty) {
                        return '  يرجاء ادخال اسم الشركة  ';
                      }

                      return null;
                    },
                    onSaved: (value) {
                      setState(() {});
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: personCont,
                    focusNode: personFocus,
                    style: const TextStyle(fontSize: 16),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.blue,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      labelText: 'اسم صاحب العمل',
                      labelStyle: TextStyle(fontSize: 16),
                    ),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.name,
                    validator: (s) {
                      if (s!.trim().isEmpty) {
                        return ' يرجاء ادخال اسم صاحب العمل ';
                      }
                      return null;
                    },
                    //   onSaved: (s) => setState(() => _namep = s),
                    onSaved: (value) {
                      setState(() {});
                    },
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
                  const SizedBox(
                    height: 10,
                  ),
                  DropdownButtonFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      prefixIcon: Icon(Icons.location_city),
                      labelText: 'المحافظة',
                      labelStyle: TextStyle(fontSize: 16),
                    ),
                    items: governorates.map((governorate) {
                      return DropdownMenuItem(
                        child: Text(governorate),
                        value: governorate,
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        _governorate = value!;
                      });
                    },
                    onSaved: (value) {
                      setState(() {
                        _governorate = value!;
                      });
                    },
                    // onSaved: (s) => setState(() => _governorate = s)
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: emailCont,
                    focusNode: emailFocus,
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
                      setState(() {});
                    },
                    //    onSaved: (s) => setState(() => _email = s),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: addressCont,
                    focusNode: addressFocus,
                    style: const TextStyle(fontSize: 16),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.location_on, color: Colors.blue),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      labelText: 'العنوان',
                      labelStyle: TextStyle(fontSize: 16),
                      alignLabelWithHint: true,
                    ),
                    maxLines: 3,
                    cursorColor: const Color.fromARGB(255, 254, 255, 255),
                    keyboardType: TextInputType.multiline,
                    validator: (s) {
                      if (s!.trim().isEmpty) return ' يرجاء إدخال العنوان ';
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {});
                    },
                    // onSaved: (s) => setState(() => _address = s)
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      child: const Text(
                        'تسجيل',
                      ),
                      onPressed: _EMPLOYERsubmit),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
