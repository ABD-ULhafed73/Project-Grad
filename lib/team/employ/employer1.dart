import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:intl/intl.dart';

import '../../main.dart';
import '../folder3/employer2.dart';

class employer1 extends StatefulWidget {
  const employer1({
    super.key,
    required String name,
    required String namep,
    required String phoneNumber,
    required String email,
    required String address,
    required String governorate,
  });

  @override
  _employer1State createState() => _employer1State();
}

class _employer1State extends State<employer1> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fdate = TextEditingController();
  final TextEditingController _ldate = TextEditingController();

  final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');
  var autoValidate = false;
  late double _amount;
  final List<String> jobTypes = [
    'دوام كامل',
    'دوام جزئي',
    'متعاقد',
    'مؤقت',
    'متدرب',
    'موظف',
  ];
  final List<String> jobLevels = [
    'متدرب',
    'محترف',
    'مبتدئ',
    'موظف اول',
    'مدير اداري',
    'مدير تنفيذي'
  ];

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

  final List<String> educations = [
    'جامعي(بكلاريوس/ليسانس)'
        'ماجستير'
        'دكتوارة'
        'دبلوم 3 سنوات',
    'دبلوم عالي',
  ];
  final List<String> gender = [
    'ذكر'
        'أنثى'
        'غير محدد'
  ];
  bool _isHovering = false;

  // ignore: unused_field
  String? _selectedjobTitle;
  // ignore: unused_field
  String? _selectedjobDescription;
  String? _selectedjobType;
  String? _selectedjobLevel;
  String? _selectedGovernorate;
  double? _salary;
  String? _selectedGender;
  String? _currencies;
  String? _selectededucation;
  String? _email;
  String? _Fdate;
  String? _Ldate;

  var emailCont = TextEditingController();
  var descripeCont = TextEditingController();
  var namejobCont = TextEditingController();
  var fdateCont = TextEditingController();
  var ldateCont = TextEditingController();
  var selectsaCont = TextEditingController();

  var fdateFocus = FocusNode();
  var ldateFocus = FocusNode();
  var emailFocus = FocusNode();
  var namejobFocus = FocusNode();

  var descripeFocus = FocusNode();
  var selectsaFocus = FocusNode();

  @override
  void dispose() {
    super.dispose();
  }

  void _EMPLOYER1submit() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => employer2(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: namejobCont,
                      focusNode: namejobFocus,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
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
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: descripeCont,
                      focusNode: descripeFocus,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        labelText: 'الوصف الوظيفي',
                        labelStyle: const TextStyle(fontSize: 16),
                      ),
                      validator: (s) {
                        if (s!.isEmpty) {
                          return 'يرجاء ادخال الوصف الوظيفي';
                        } else if (s.isNotEmpty) {
                          return null;
                        }
                      },
                      onChanged: (value) {
                        setState(() {
                          _selectedjobDescription = value;
                        });
                      },
                      onSaved: (value) {
                        setState(() {
                          _selectedjobDescription = value!;
                        });
                      },
                      maxLines: 3,
                    ),
                    const SizedBox(height: 16.0),
                    DropdownButtonFormField(
                      isDense: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          labelText: 'نوع الوظيفة ',
                          labelStyle: const TextStyle(fontSize: 16),
                          hintText: ''),
                      value: _selectedjobType,
                      items: jobTypes.map((joptype) {
                        return DropdownMenuItem(
                          value: joptype,
                          child: Text(joptype),
                        );
                      }).toList(),
                      validator: (s) {
                        if (s!.isEmpty) {
                          return 'يرجاء ادخال نوع الوظيفية';
                        } else if (!s.isNotEmpty) {
                          return null;
                        }
                      },
                      onChanged: (value) {
                        setState(() {
                          _selectedjobType = value!;
                        });
                      },
                      onSaved: (value) {
                        setState(() {
                          _selectedjobType = value!;
                        });
                      },
                    ),
                    const SizedBox(height: 16.0),
                    DropdownButtonFormField(
                      // isDense: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        labelText: ' التعليم ',
                        labelStyle: const TextStyle(fontSize: 16),
                      ),
                      value: _selectededucation,
                      items: educations.map((education) {
                        return DropdownMenuItem(
                          value: education,
                          child: Text(education),
                        );
                      }).toList(),
                      validator: (s) {
                        if (s!.isEmpty) {
                          return 'يرجاء ادخال التعليم ';
                        } else if (s.isNotEmpty) {
                          return null;
                        }
                      },
                      onChanged: (value) {
                        setState(() {
                          _selectededucation = value;
                        });
                      },
                      onSaved: (value) {
                        setState(() {
                          _selectededucation = value!;
                        });
                      },
                    ),
                    const SizedBox(height: 16.0),
                    DropdownButtonFormField(
                      // isDense: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        labelText: ' المستوى الوظيفي',
                        labelStyle: const TextStyle(fontSize: 16),
                      ),
                      value: _selectedjobLevel,
                      items: jobLevels.map((level) {
                        return DropdownMenuItem(
                          value: level,
                          child: Text(level),
                        );
                      }).toList(),
                      validator: (s) {
                        if (s!.isEmpty) {
                          return 'يرجاء ادخال المستوى الوظيفي';
                        } else if (s.isNotEmpty) {
                          return null;
                        }
                      },
                      onChanged: (value) {
                        setState(() {
                          _selectedjobLevel = value;
                        });
                      },
                      onSaved: (value) {
                        setState(() {
                          _selectedjobLevel = value!;
                        });
                      },
                    ),
                    SizedBox(
                      height: 25,
                      child: Text('سنين الخبرة'),
                    ),

                    Container(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: fdateCont,
                              decoration: InputDecoration(
                                hintText: '  من تاريخ:-',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                              ),
                              onTap: () async {
                                DateTime date = DateTime(1900);
                                FocusScope.of(context)
                                    .requestFocus(new FocusNode());

                                date = (await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2100)))!;

                                _fdate.text = _dateFormat.format(date);
                              },
                              onChanged: (value) {
                                setState(() {
                                  _Fdate = value;
                                });
                              },
                            ),
                          ),
                          SizedBox(width: 16.0),
                          Expanded(
                            child: TextField(
                              controller: ldateCont,
                              decoration: InputDecoration(
                                hintText: 'إلى تاريخ:-',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                              ),
                              onTap: () async {
                                DateTime date = DateTime(1900);
                                FocusScope.of(context)
                                    .requestFocus(new FocusNode());

                                date = (await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2100)))!;

                                _ldate.text = _dateFormat.format(date);
                              },
                              onChanged: (value) {
                                setState(() {
                                  _Ldate = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16.0),

                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
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

                    //////////////////////
                    const SizedBox(height: 16.0),
                    Row(
                      children: [
                        DropdownButton<String>(
                          //  value: currencies,
                          underline: const SizedBox(
                            height: 0,
                          ),

                          icon: Container(
                            padding: const EdgeInsets.only(left: 9),
                            child: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black,
                            ),
                          ),
                          items: <String>[
                            'دولار',
                            'ريال يمني',
                            'ريال سعودي',
                          ].map<DropdownMenuItem<String>>((currencies) {
                            return DropdownMenuItem(
                              // ignore: sort_child_properties_last
                              child: Tooltip(
                                message: currencies,
                                child: Container(
                                  margin: const EdgeInsets.only(
                                    left: 4,
                                    right: 4,
                                  ),
                                  child: Text(currencies),
                                ),
                              ),
                              value: currencies,
                            );
                          }).toList(),
                          onChanged: (value) {
                            // ignore: avoid_print

                            setState(() {
                              _currencies = value;
                            });
                          },
                        ),
                        const SizedBox(height: 16.0),
                        Container(
                          child: TextFormField(
                            controller: selectsaCont,
                            focusNode: selectsaFocus,
                            keyboardType: TextInputType.phone,
                            maxLength: 10,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              counter: 0.height,
                              hintText: ' حددالراتب ',
                              helperStyle: const TextStyle(fontSize: 16),
                              hintStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.2)),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                              ),
                              suffixIcon: const Icon(Icons.payment),
                              labelText: 'الراتب',
                              labelStyle: const TextStyle(fontSize: 16),
                            ),
                            validator: (s) {
                              if (s!.trim().isEmpty) {
                                return '  يرجاء ادخال  الراتب  ';
                              }

                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                _salary = value as double?;
                              });
                            },
                            /*    onSaved: (s) {
                          SharedPreferences.getInstance().then((prefs) {
                            prefs.setString('الراتب ', s!);
                          });
                        },*/
                            onSaved: (value) {
                              setState(() {
                                _salary = value! as double?;
                              });
                            },
                          ),
                        ).expand(),
                      ],
                    ),

                    const SizedBox(height: 16.0),

                    DropdownButtonFormField(
                      //  isDense: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        labelText: 'النوع',
                        labelStyle: const TextStyle(fontSize: 16),
                      ),
                      items: gender.map((gender) {
                        return DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                        );
                      }).toList(),
                      validator: (s) {
                        if (s!.isEmpty) {
                          return 'يرجاء ادخال الوصف الوظيفي';
                        } else if (!s.isNotEmpty) {
                          return null;
                        }
                      },
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
                      value: _selectedGender,
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: emailCont,
                      focusNode: emailFocus,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        labelText: 'البريد الإلكتروني',
                        labelStyle: const TextStyle(fontSize: 16),
                      ),
                      validator: (s) {
                        if (s!.isEmpty) {
                          return 'يرجاء ادخال البريد الالكتروني';
                        }
                        if (!s.contains('@gmail.com')) {
                          return null;
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
                        child: const Text('أضف الوظيفة'),
                        onPressed: _EMPLOYER1submit),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
