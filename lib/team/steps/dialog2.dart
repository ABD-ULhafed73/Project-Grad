import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:projectflutter/team/data/page22.dart';
import 'package:projectflutter/team/steps/jobseekersignup.dart';

import '../../main.dart';
import 'keyInformation.dart';

// ignore: camel_case_types
class dialog2 extends StatefulWidget {
  static String tag = '/employer';

  const dialog2({super.key});

  @override
  dialog2State createState() => dialog2State();
}

class dialog2State extends State<dialog2> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late SearchBar searchBar;

  final GlobalKey<FormFieldState<String>> _passwordFieldKey =
      GlobalKey<FormFieldState<String>>();
  final _phoneNumberController = TextEditingController();
  String? _phoneNumberError;
  CountryCode? _selectedCode;
  var autoValidate = false;

  late String _name;
  String? _password;
  late String _phoneNumber;

  String? _selectedjobTitle;

  var usernameCont = TextEditingController();
  var personCont = TextEditingController();
  var emailCont = TextEditingController();
  var phoneCont = TextEditingController();
  var addressCont = TextEditingController();
  var provinceCont = TextEditingController();
  final _governoratesController = TextEditingController();

  var usernameFocus = FocusNode();
  var personFocus = FocusNode();
  var emailFocus = FocusNode();
  var phoneFocus = FocusNode();
  var addressFocus = FocusNode();
  var provinceFoucus = FocusNode();

  // ignore: unused_field
  // String? _selectedGovernorate;
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
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate: Searchpage());
                  },
                  icon: const Icon(Icons.search),
                ),
              ],
              elevation: 4.0,
              /*  flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.topCenter,
              colors: Colors.accents,
            )),
          ),*/
              toolbarHeight: 80,
              automaticallyImplyLeading: false,
              expandedHeight: 160.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text("FlexibleSpace title"),
                background: Image.asset(
                  'assesst/img/class18.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),

            // If the main content is a list, use SliverList instead.
            SliverFillRemaining(
              child: Container(
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
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.foundation_rounded,
                              color: Colors.blue,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100.0),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                            labelText: 'اسم ',
                            labelStyle: const TextStyle(fontSize: 16),
                          ),
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.name,
                          validator: (s) {
                            if (s!.trim().isEmpty) {
                              return '  يرجاء ادخال اسم   ';
                            }

                            return null;
                          },
                          onSaved: (value) {
                            setState(() {
                              _name = value!;
                            });
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
                        TextFormField(
                          // controller: namejobCont,
                          //focusNode: namejobFocus,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.black87),
                            ),
                            labelText: 'المسمى الوظيفي',
                            labelStyle: const TextStyle(fontSize: 16),
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
                              _selectedjobTitle = value;
                            });
                          },
                          onSaved: (value) {
                            setState(() {
                              _selectedjobTitle = value!;
                            });
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: true,
                            labelText: ' عنوان البريد الالكتروني ',
                            prefixIcon: Icon(
                              Icons.email,
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (String? value) {
                            this._password = value!;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Theme(
                          data: ThemeData.light(),
                          child: MaterialButton(
                            color: const Color.fromARGB(255, 67, 107, 153),
                            onPressed: () {
                              //  if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              // autoValidate = true;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => keyInformation(
                                          item: '',
                                        )),
                              );
                              // }
                            },
                            child: const Text(
                              'تسجيل',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
