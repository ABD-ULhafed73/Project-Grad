
 /*
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
                        return 'البريد الالكتروني غير صالح   ';
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 8),
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25.0)),
                          border: Border.all(
                              color: Colors.blue.withOpacity(0.2), width: 0.6),
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
                          controller: _phoneCont,
                          focusNode: phoneFocus,
                          keyboardType: TextInputType.phone,
                          maxLength: 10,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.phone,
                              color: Colors.blue,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            counter: 0.height,
                            hintText: 'نوع الرقم  ',
                            helperStyle: const TextStyle(fontSize: 12),
                            hintStyle:
                                TextStyle(color: Colors.black.withOpacity(0.2)),
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0.0),
                                  width: 0.6),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(25.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(25.0)),
                              borderSide: BorderSide(
                                  color: Colors.blue.withOpacity(0.0),
                                  width: 0.6),
                            ),
                            labelText: 'رقم الهاتف',
                            labelStyle: const TextStyle(color: Colors.black),
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
                          onSaved: (value) {
                            setState(() {
                              _phoneNumber2 = value!;
                            });
                          },
                        ),
                      ).expand(),
                    ],
                  ),
                  10.height,
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
                  */ /*   DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: 'الجنسية',
                        border: OutlineInputBorder(),
                      ),
                      items: _nationalities.map((_nationality) {
                        return DropdownMenuItem(
                          value: _nationality,
                          child: Text(_nationality),
                        );
                      }).toList(),
                      validator: (s) {
                        if (s!.isEmpty) {
                          return ' يرجاء ادخال  الجنسية';
                        } else if (!s.isNotEmpty) {
                          return null;
                        }
                      },
                      onChanged: (value) {
                        setState(() {
                          _nationality2 = value!;
                        });
                      },
                    ),
                     SizedBox(height: 10),
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    labelText: 'دولة الاقامة',
                    border: OutlineInputBorder(),
                  ),
                  items: _countries.map((_country) {
                    return DropdownMenuItem(
                      value: _country,
                      child: Text(_country),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _country = value!;
                    });
                  },
                ),*/ /*    Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 8),
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25.0)),
                          border: Border.all(
                              color: Colors.blue.withOpacity(0.2), width: 0.6),
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
                          controller: _phoneCont,
                          focusNode: phoneFocus,
                          keyboardType: TextInputType.phone,
                          maxLength: 10,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.phone,
                              color: Colors.blue,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            counter: 0.height,
                            hintText: 'نوع الرقم  ',
                            helperStyle: const TextStyle(fontSize: 12),
                            hintStyle:
                                TextStyle(color: Colors.black.withOpacity(0.2)),
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0.0),
                                  width: 0.6),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(25.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(25.0)),
                              borderSide: BorderSide(
                                  color: Colors.blue.withOpacity(0.0),
                                  width: 0.6),
                            ),
                            labelText: 'رقم الهاتف',
                            labelStyle: const TextStyle(color: Colors.black),
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
                          onSaved: (value) {
                            setState(() {
                              _phoneNumber2 = value!;
                            });
                          },
                        ),
                      ).expand(),
                    ],
                  ),
                  10.height,*/

                  /*
                  import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:libphonenumber/libphonenumber.dart';

class Page22 extends StatefulWidget {
  const Page22({Key? key}) : super(key: key);

  @override
  _Page22State createState() => _Page22State();
}

class _Page22State extends State<Page22> {
  final _formKey = GlobalKey<FormState>();
  var _autoValidate = false;

  String? _name;
  String? _email;
  String? _selectedJobTitle;
  String? _password;
  String? _phoneNumber;
  String? _phoneNumberError;
  CountryCode? _selectedCode;

  final _dateFormat = DateFormat('dd/MM/yyyy');

  final List<String> _provinces = [
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

  final List<String> _employmentStatuses = [
    'ابحث عن وظيفة',
    'اعمل وابحث عنوظيفة',
    'لا ابحث عن وظيفة',
  ];

  final List<String> _profilePrivacyOptions = [
    'عام.اي مستحدم يستطيع ان يعرض ملفي الشخصي',
    'فقط اصحاب العمل المسجلين يمكنهم عرض ملفي الشخصي',
    'مخفي. يظهر فقط لمن عن الوظيفة الخاصة به',
  ];

  final List<String> _genders = [
    'ذكر',
    'أنثى',
    'غير محدد',
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final scaleFactor = screenSize.width > 600 ? 105 : 1.0;

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
              autovalidateMode: _autoValidate
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    initialValue: _name,
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
                    cursorColor:Colors.black,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'يرجى إدخال الاسم';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _name = value;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    initialValue: _email,
                    style: const TextStyle(fontSize: 16),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      labelText: 'البريد الإلكتروني',
                      labelStyle: TextStyle(fontSize: 16),
                    ),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'يرجى إدخال البريد الإلكتروني';
                      }
                      if (!value.contains('@')) {
                        return 'يرجى إدخال بريد إلكتروني صحيح';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    initialValue: _password,
                    style: const TextStyle(fontSize: 16),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      labelText: 'كلمة المرور',
                      labelStyle: TextStyle(fontSize: 16),
                    ),
                    cursorColor: Colors.black,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'يرجى إدخال كلمة المرور';
                      }
                      if (value.length < 6) {
                        return 'يجب أن تتكون كلمة المرور من 6 أحرف على الأقل';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _password = value;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: TextEditingController(text: _phoneNumber),
                    style: const TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      labelText: 'رقم الهاتف',
                      labelStyle: const TextStyle(fontSize: 16),
                      errorText: _phoneNumberError,
                      suffixIcon: CountryCodePicker(
                        onChanged: (code) {
                          setState(() {
                            _selectedCode = code;
                          });
                        },
                        initialSelection: _selectedCode?.code ?? 'YE',
                        favorite: ['+966', '+971', '+20', '+971'],
                        showCountryOnly: false,
                        showOnlyCountryWhenClosed: false,
                        alignLeft: false,
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                    ),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'يرجى إدخال رقم الهاتف';
                      }
                      if (_phoneNumberError != null) {
                        return _phoneNumberError;
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _phoneNumber = value;
                    },
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: _selectedJobTitle,
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
                    onChanged: (value) {
                      setState(() {
                        _selectedJobTitle = value;
                      });
                    },
                    items: [
                      for (var jobTitle in _employmentStatuses)
                        DropdownMenuItem(
                          value: jobTitle,
                          child: Text(jobTitle),
                        ),
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'يرجى اختيار المسمى الوظيفي';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _selectedJobTitle = value;
                    },
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: _genders[0],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(*/