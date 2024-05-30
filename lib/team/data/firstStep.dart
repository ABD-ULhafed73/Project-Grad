/*import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'firstStepData.dart';

class firstStep extends StatefulWidget {
  const firstStep({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _firstStepState createState() => _firstStepState();
}

class _firstStepState extends State<firstStep> {
  final _formKey = GlobalKey<FormState>();
  final _degreeCont = TextEditingController();
  final _namecollageCont = TextEditingController();
  final _departCont = TextEditingController();
  final _endyearCont = TextEditingController();
  final _appreciationCont = TextEditingController();

  String? _eductiondegree;
  String? _namecollageoruniv;
  String? _department1;
  String? _selectedGrade;

  int? _selectedYear;

  @override
  void dispose() {
    _degreeCont.dispose();
    _namecollageCont.dispose();
    _departCont.dispose();
    _endyearCont.dispose();
    _appreciationCont.dispose();

    super.dispose();
  }

  void _firstStepdata() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DisplayFormDataScreen(
            degree: _degreeCont.text,
            nameOfCollege: _namecollageCont.text,
            department: _departCont.text,
            yearOfGraduation: _selectedYear!,
            grade: _appreciationCont.text,
          ),
        ),
      );
    }
  }

  final List<String> educations1 = [
    'جامعي(بكلاريوس/ليسانس)',
    'ماجستير',
    'دكتوارة',
    'دبلوم 3 سنوات',
    'دبلوم عالي',
  ];

  @override
  Widget build(BuildContext context) {
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
        title: const Text('أضف وظيفة جديدة'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'الموهلات الدراسية',
                  style: TextStyle(fontSize: 28, color: Colors.black),
                ),
                TextFormField(
                  controller: _degreeCont,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    labelText: 'الدرجة العلمية',
                    suffixIcon: DropdownButton<String>(
                      value: _eductiondegree,
                      onChanged: (s) {
                        setState(() {
                          _eductiondegree = s;
                          _degreeCont.text = s!;
                        });
                      },
                      items: educations1
                          .map<DropdownMenuItem<String>>((educations1) {
                        return DropdownMenuItem<String>(
                          value: educations1,
                          child: Text(educations1),
                        );
                      }).toList(),
                    ),
                  ),
                  validator: (s) {
                    if (s!.isEmpty) {
                      return ' يرجاء ادخال الدرجة العلمية';
                    } else if (!s.isNotEmpty) {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _namecollageCont,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    labelText: ' اسم الكليه او الجامعة او المعهد',
                    labelStyle: const TextStyle(fontSize: 16),
                  ),
                  validator: (s) {
                    if (s!.isEmpty) {
                      return 'يرجاء ادخال اسم الكليه او الجامعة او المعهد';
                    } else if (!s.isNotEmpty) {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      _namecollageoruniv = value;
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
                      labelText: 'مجال العمل  ',
                      labelStyle: const TextStyle(fontSize: 16),
                      hintText: ''),
                  validator: (s) {
                    if (s!.isEmpty) {
                      return '  يرجاء ادخال مجال العمل';
                    } else if (!s.isNotEmpty) {
                      return null;
                    }
                  },
                  onChanged: (s) {
                    setState(() {
                      _department1 = s;
                    });
                  },
                ),
                const SizedBox(height: 16.0),

                ///years
                TextFormField(
                  controller: _endyearCont,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    labelText: 'سنة الانتهاء من التخرج',
                    suffixIcon: DropdownButton<int>(
                      value: _selectedYear,
                      onChanged: (s) {
                        setState(() {
                          _selectedYear = s;
                          _endyearCont.text = s.toString();
                        });
                      },
                      items: List<int>.generate(50, (i) => i + 1980)
                          .map<DropdownMenuItem<int>>((generate) {
                        return DropdownMenuItem<int>(
                          value: generate,
                          child: Text(generate.toString()),
                        );
                      }).toList(),
                    ),
                  ),
                  validator: (s) {
                    if (s!.isEmpty) {
                      return ' يرجاء ادخال سنة الانتهاء من التخرج';
                    } else if (!s.isNotEmpty) {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 16.0),

                TextFormField(
                  controller: _appreciationCont,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    labelText: 'التقدير',
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedGrade = newValue;
                    });
                  },
                  validator: (level) {
                    if (level!.isEmpty) {
                      return 'يرجاء ادخال التقدير';
                    } else if (!level.isNotEmpty) {
                      return null;
                    }
                  },
                ),

                // controller: TextEditingController(text: _selectedGrade),
                // readOnly: true,

                const SizedBox(height: 10),
                ElevatedButton(
                    child: const Text('أضف الوظيفة'),
                    onPressed: _firstStepdata),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/