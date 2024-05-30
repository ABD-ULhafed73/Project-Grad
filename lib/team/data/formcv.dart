/*import 'package:flutter/material.dart';

class MyResume extends StatefulWidget {
  const MyResume({super.key});

  @override
  _MyResumeState createState() => _MyResumeState();
}

class _MyResumeState extends State<MyResume> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _birthdateController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _nationalityController = TextEditingController();
  final _maritalStatusController = TextEditingController();
  final _summaryController = TextEditingController();
  final _educationController = TextEditingController();
  final _certificationsController = TextEditingController();
  final _experienceController = TextEditingController();
  final _skillsController = TextEditingController();
  final _projectsController = TextEditingController();
  final _interestsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resume'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Row(
            children: [
              Container(
                decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: const Offset(0.0, 10.0)),
                  ],
                ),
               // width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisSize: MainAxisSize.min, // To make the card compact
                  children: <Widget>[
                    Text(
                      'Personal Information',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                          labelText: 'Full Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(15 as Radius))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _birthdateController,
                      decoration: InputDecoration(
                        labelText: 'Date of Birth',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your birthdate';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _addressController,
                      decoration: InputDecoration(labelText: 'Address'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your address';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _phoneController,
                      decoration: InputDecoration(labelText: 'Phone'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email address';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _nationalityController,
                      decoration: InputDecoration(labelText: 'Nationality'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your nationality';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _maritalStatusController,
                      decoration: InputDecoration(labelText: 'Marital Status'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your marital status';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Personal Summary',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      controller: _summaryController,
                      decoration: InputDecoration(labelText: 'Summary'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your summary';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Education',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      controller: _educationController,
                      decoration: InputDecoration(labelText: 'Education'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your education';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _certificationsController,
                      decoration: InputDecoration(labelText: 'Certifications'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your certifications';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Work Experience',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      controller: _experienceController,
                      decoration: InputDecoration(labelText: 'Experience'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your work experience';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Skills',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      controller: _skillsController,
                      decoration: InputDecoration(labelText: 'Skills'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your skills';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Projects and Achievements',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      controller: _projectsController,
                      decoration: InputDecoration(
                          labelText: 'Projects and Achievements'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your projects and achievements';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Interests and Hobbies',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      controller: _interestsController,
                      decoration:
                          InputDecoration(labelText: 'Interests and Hobbies'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your interests and hobbies';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      child: Text('Submit'),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // TODO: Submit the form data to a backend service or save it locally
                          print('Form data saved');
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                 
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10.0,
                        offset: const Offset(0.0, 10.0)),
                  ],
                ),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisSize: MainAxisSize.min, // To make the card compact
                  children: <Widget>[
                    Text(
                      'Personal Information',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                          labelText: 'Full Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(15 as Radius))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _birthdateController,
                      decoration: InputDecoration(
                        labelText: 'Date of Birth',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your birthdate';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _addressController,
                      decoration: InputDecoration(labelText: 'Address'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your address';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _phoneController,
                      decoration: InputDecoration(labelText: 'Phone'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email address';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _nationalityController,
                      decoration: InputDecoration(labelText: 'Nationality'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your nationality';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _maritalStatusController,
                      decoration: InputDecoration(labelText: 'Marital Status'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your marital status';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Personal Summary',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      controller: _summaryController,
                      decoration: InputDecoration(labelText: 'Summary'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your summary';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Education',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      controller: _educationController,
                      decoration: InputDecoration(labelText: 'Education'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your education';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _certificationsController,
                      decoration: InputDecoration(labelText: 'Certifications'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your certifications';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Work Experience',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      controller: _experienceController,
                      decoration: InputDecoration(labelText: 'Experience'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your work experience';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Skills',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      controller: _skillsController,
                      decoration: InputDecoration(labelText: 'Skills'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your skills';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Projects and Achievements',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      controller: _projectsController,
                      decoration: InputDecoration(
                          labelText: 'Projects and Achievements'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your projects and achievements';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Interests and Hobbies',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      controller: _interestsController,
                      decoration:
                          InputDecoration(labelText: 'Interests and Hobbies'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your interests and hobbies';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      child: Text('Submit'),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // TODO: Submit the form data to a backend service or save it locally
                          print('Form data saved');
                        }
                      },
                    ),
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
import 'package:flutter/material.dart';

class LRow extends StatefulWidget {
  const LRow({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LRowState createState() => _LRowState();
}

enum SingingCharacter { spaceEvenly, start, center }

class _LRowState extends State<LRow> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _startController = TextEditingController();
  final _lastdateController = TextEditingController();

  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _nationalityController = TextEditingController();
  final _maritalStatusController = TextEditingController();
  final _summaryController = TextEditingController();
  final _educationController = TextEditingController();
  final _certificationsController = TextEditingController();
  final _experienceController = TextEditingController();
  final _skillsController = TextEditingController();
  final _projectsController = TextEditingController();
  final _interestsController = TextEditingController();

  int? _startdate;
  int? _enddate;

  SingingCharacter _character = SingingCharacter.spaceEvenly;
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.spaceEvenly;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: _mainAxisAlignment,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    color: Colors.green[50],
                    child: Column(
                      mainAxisSize:
                          MainAxisSize.min, // To make the card compact
                      children: <Widget>[
                        Text(
                          'الخبرات',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
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
                        TextFormField(
                          controller: _addressController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            labelText: 'مكان الشركة',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                   return ' يرجاء إ دخال مكان الشركة';
                            }
                            return null;
                          },
                        ),
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
                                    labelText: 'سنة الانتهاء من التخرج',
                                    suffixIcon: DropdownButton<int>(
                                      value: _startdate,
                                      onChanged: (s) {
                                        setState(() {
                                          _startdate = s;
                                          _startController.text = s.toString();
                                        });
                                      },
                                      items: List<int>.generate(
                                              50, (i) => i + 1980)
                                          .map<DropdownMenuItem<int>>(
                                              (generate) {
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
                                    labelText: 'سنة الانتهاء من التخرج',
                                    suffixIcon: DropdownButton<int>(
                                      value: _enddate,
                                      onChanged: (s) {
                                        setState(() {
                                          _enddate = s;
                                          _lastdateController.text =
                                              s.toString();
                                        });
                                      },
                                      items: List<int>.generate(
                                              50, (i) => i + 1980)
                                          .map<DropdownMenuItem<int>>(
                                              (generate) {
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
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        TextFormField(
                          controller: _phoneController,
                          decoration: InputDecoration(
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
                        Text(
                          'Interests and Hobbies',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
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
        ),
      ],
    );
  }
}
 TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(labelText: ''),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return '';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _nationalityController,
                          decoration: InputDecoration(labelText: ''),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return '';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _maritalStatusController,
                          decoration: InputDecoration(labelText: ''),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return '';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        Text(
                          '',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                          controller: _summaryController,
                          decoration: InputDecoration(labelText: ''),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return '';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        Text(
                          '',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                          controller: _educationController,
                          decoration: InputDecoration(labelText: ''),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return '';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _certificationsController,
                          decoration: InputDecoration(labelText: ''),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return '';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        Text(
                          '',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                          controller: _experienceController,
                          decoration: InputDecoration(labelText: ''),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return '';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Skills',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                          controller: _skillsController,
                          decoration: InputDecoration(labelText: 'Skills'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your skills';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Projects and Achievements',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                          controller: _projectsController,
                          decoration: InputDecoration(
                              labelText: 'Projects and Achievements'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your projects and achievements';
                            }
                            return null;
                          },
                        ),
*/