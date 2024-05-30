import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../main.dart';

class NewJob extends StatefulWidget {
  const NewJob({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NewJobState createState() => _NewJobState();
}

class _NewJobState extends State<NewJob> {
  final _formKey = GlobalKey<FormState>();
  // ignore: unused_field
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
    'مدير تنفيذي',
  ];
  final List<String> newjob = [
    'لا',
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
  String? currencies;

  final List<String> educations = [
    'جامعي(بكلاريوس/ليسانس)',
    'ماجستير',
    'دكتوارة',
    'دبلوم 3 سنوات',
    'دبلوم عالي',
  ];
  final List<String> gender = [
    'ذكر',
    'أنثى',
    'غير محدد',
  ];

  String? _selectedjobTitle;
  String? _selectedjobDescription;
  String? _selectedjobType;
  String? _selectedjobLevel;
  String? _selectedGovernorate;
  String? _selectedSalary;
  String? _selectedGender;
  String? _selectednewjob;
  String? _selectededucation;
  var controllerCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'بحث',
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: Searchpage());
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DropdownButtonFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      labelText: 'هل تريد اسنخدام بيانات وظيفة سابقة  ',
                      labelStyle: const TextStyle(fontSize: 16),
                      hintText: ''),
                  value: _selectednewjob,
                  items: newjob.map((newjob) {
                    return DropdownMenuItem(
                      value: newjob,
                      child: Text(newjob),
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
                      _selectednewjob = value!;
                    });
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
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
                    } else if (!s.isNotEmpty) {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      _selectedjobTitle = value;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
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
                    } else if (!s.isNotEmpty) {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      _selectedjobDescription = value;
                    });
                  },
                  maxLines: 3,
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
                    } else if (!s.isNotEmpty) {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      _selectededucation = value!;
                    });
                  },
                  onSaved: (value) => {},
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
                    } else if (!s.isNotEmpty) {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      _selectedjobLevel = value!;
                    });
                  },
                  onSaved: (value) => {},
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
                  onSaved: (value) => {},
                  value: _selectedGovernorate,
                ),
                //////////////////////
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    /*  Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                            color: Colors.blue.withOpacity(0.2), width: 0.6),
                      ),*/
                    Text(
                      'العمله',
                      style: boldTextStyle(),
                    ),
                    DropdownButton<String>(
                      value: currencies,
                      underline: const SizedBox(
                        height: 0,
                      ),
                      hint: Container(
                        // ignore: sort_child_properties_last
                        child: const Text('العمله'),
                        //color: Colors.black,
                        padding: const EdgeInsets.only(left: 4),
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
                        print(value);
                        setState(() {
                          _selectedSalary = value!;
                        });
                      },
                    ),
                    const SizedBox(height: 16.0),
                    Container(
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        // maxLength: 10,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                          counter: 0.height,
                          hintText: ' الراتب ',
                          helperStyle: const TextStyle(fontSize: 16),
                          hintStyle:
                              TextStyle(color: Colors.black.withOpacity(0.2)),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          labelText: 'الراتب',
                          labelStyle: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ).expand(),
                  ],
                ),

                const SizedBox(height: 16.0),

                ///////////////////
                DropdownButtonFormField(
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
                    setState(() {
                      _selectedGender = value!;
                    });
                  },
                  onSaved: (value) => {},
                  value: _selectedGender,
                ),
                const SizedBox(height: 16.0),
                TextFormField(
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
                      return 'ادخل بريد الكتروني صالح';
                    }
                    return null;
                  },
                  onSaved: (value) => {},
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  child: const Text('أضف الوظيفة'),
                  onPressed: () {
                    _formKey.currentState?.save();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
