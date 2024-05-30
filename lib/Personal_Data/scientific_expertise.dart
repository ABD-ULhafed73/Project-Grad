import 'package:flutter/material.dart';
import 'package:projectflutter/Personal_Data/testimonial.dart';

class expertise extends StatefulWidget {
  const expertise(
      {super.key,
      required String degree,
      required String nameOfCollege,
      required String department,
      required int yearOfGraduation,
      required String grade});

  @override
  // ignore: library_private_types_in_public_api
  _expertiseState createState() => _expertiseState();
}

enum SingingCharacter { spaceEvenly, start, center }

class _expertiseState extends State<expertise> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _nameofcompanyController = TextEditingController();
  final _addressController = TextEditingController();
  final _startController = TextEditingController();
  final _lastdateController = TextEditingController();
  final _descripofexpertise = TextEditingController();

  int? _startdate;
  int? _enddate;

  SingingCharacter _character = SingingCharacter.spaceEvenly;
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.spaceEvenly;

  @override
  void dispose() {
    _nameController.dispose();
    _nameofcompanyController.dispose();
    _addressController.dispose();
    _startController.dispose();
    _lastdateController.dispose();
    _descripofexpertise.dispose();

    super.dispose();
  }

  void expertisesubmit() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Testimonial(
            experjobname: _nameController.text,
            expercomanyname: _nameofcompanyController.text,
            expercomanyplace: _addressController.text,
            experofdate: _startController.value,
            expertodate: _lastdateController.value,
            brief: '',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Container(
                //color: Colors.green[50],
                child: Column(
                  mainAxisSize: MainAxisSize.min, // To make the card compact
                  children: <Widget>[
                    Text(
                      'الخبرات',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'المسمى الوظيفي ',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'يرجاء إدخال المسمى الوظيفي';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: _nameofcompanyController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        labelText: 'اسم الشركة',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ' يرجاء إ دخال اسم الشركة';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: _addressController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          labelText: ' يرجاء إ دخال مكان الشركة'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ' يرجاء إ دخال مكان الشركة';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    Container(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child:

                                ///years
                                TextFormField(
                              controller: _startController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                                labelText: '  من تاريخ',
                                suffixIcon: DropdownButton<int>(
                                  value: _startdate,
                                  onChanged: (s) {
                                    setState(() {
                                      _startdate = s;
                                      _startController.text = s.toString();
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
                                  return ' يرجاء ادخال سنوات الخبرة';
                                } else if (!s.isNotEmpty) {
                                  return null;
                                }
                              },
                            ),
                          ),
                          SizedBox(width: 16.0),
                          Expanded(
                            child: TextFormField(
                              controller: _lastdateController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                                labelText: '   الى تاريخ',
                                suffixIcon: DropdownButton<int>(
                                  value: _enddate,
                                  onChanged: (s) {
                                    setState(() {
                                      _enddate = s;
                                      _lastdateController.text = s.toString();
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
                                  return ' يرجاء ملء الحقل ';
                                } else if (!s.isNotEmpty) {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: _descripofexpertise,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          labelText: 'الوصف '),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ' يرجاء ادخال الوصف';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                        onPressed: expertisesubmit, child: Text('تسجيل')),
                  ],
                ),
              ),
              Container(
                color: Colors.yellow[50],
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "İtem2",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
