import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../Personal_Data/brief.dart';

class keyinformation2 extends StatefulWidget {
  const keyinformation2({
    super.key,
    required String braithDate,
    required String gender,
    required String address,
    required String province,
  });

  @override
  State<keyinformation2> createState() => _keyinformation2State();
}

class _keyinformation2State extends State<keyinformation2> {
  final _formKey = GlobalKey<FormState>();
  var autoValidate = false;

  final _braithDateCont = TextEditingController();
  final _descrip2Cont = TextEditingController();
  final _salary2Cont = TextEditingController();
  final _experiencesCont = TextEditingController();

  final TextEditingController _dateCont = TextEditingController();

  var braithDateFocus = FocusNode();
  var descrip2Focus = FocusNode();
  var salary2Focus = FocusNode();
  var experiencesFocus = FocusNode();

  String? _selectedemploymentstatus2;
  String? _selectedprofileprivacy2;
  String? _currencies2;

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

  @override
  void dispose() {
    _braithDateCont.dispose();
    _descrip2Cont.dispose();

    _salary2Cont.dispose();
    _experiencesCont.dispose();
    super.dispose();
  }

  void _keyinformationsubmit2() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => dialogbrief(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Align(
                  child: Text(
                    '2 المعلومات الرئسية',
                    style: TextStyle(fontSize: 20, color: Colors.black87),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                DropdownButtonFormField(
                  isDense: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      labelText: 'حالة التوظيف  ',
                      labelStyle: TextStyle(fontSize: 16),
                      hintText: ''),
                  value: _selectedemploymentstatus2,
                  items: employmentstatus.map((joptype) {
                    return DropdownMenuItem(
                      value: joptype,
                      child: Text(joptype),
                    );
                  }).toList(),
                  validator: (s) {
                    if (s!.isEmpty) {
                      return 'يرجاء ادخال حالة التوظيف ';
                    } else if (!s.isNotEmpty) {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      _selectedemploymentstatus2 = value! as String?;
                    });
                  },
                  onSaved: (value) {
                    setState(() {
                      _selectedemploymentstatus2 = value! as String?;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    labelText: ' خصوصية الملف الشخصي  ',
                    labelStyle: TextStyle(fontSize: 16),
                  ),
                  value: _selectedprofileprivacy2,
                  items: profileprivacy.map((education) {
                    return DropdownMenuItem(
                      value: education,
                      child: Text(education),
                    );
                  }).toList(),
                  validator: (s) {
                    if (s!.isEmpty) {
                      return 'يرجاء ادخال خصوصية الملف الشخصي  ';
                    } else if (s.isNotEmpty) {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      _selectedprofileprivacy2 = value;
                    });
                  },
                  onSaved: (value) {
                    setState(() {
                      _selectedprofileprivacy2 = value!;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _experiencesCont,
                  focusNode: experiencesFocus,
                  style: const TextStyle(fontSize: 16),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.elliptical(20, 20),
                        topLeft: Radius.elliptical(20, 20),
                      ),
                    ),
                    labelText: 'عدد سنوات الخبرة ',
                    labelStyle: TextStyle(fontSize: 16),
                  ),
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.name,
                  onChanged: (String s) {
                    if (s.isNotEmpty) {
                      TextEditingValue(
                        text: '$sسنوات ',
                        selection: TextSelection.fromPosition(
                          TextPosition(
                            offset: '$s سنوات'.length,
                          ),
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    DropdownButton<String>(
                      value: _currencies2,
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
                        'ريال سعودي',
                        'دينار جزائري',
                        'دينار بحريني',
                        'دينار كويتي',
                        'جنية مصري',
                        'دينار أردني',
                        'دينار لبناني',
                        'دينار ليبي',
                        'درهم مغربي',
                        'ريال عُماني',
                        'ريال قطري',
                        'دينار صومالي',
                        'دينار سوداني',
                        'ليرة سورية',
                        'دينار تونسي',
                        'ريال يمني'
                      ].map<DropdownMenuItem<String>>((currencies2) {
                        return DropdownMenuItem(
                          // ignore: sort_child_properties_last
                          child: Tooltip(
                            message: currencies2,
                            child: Container(
                              margin: const EdgeInsets.only(
                                left: 4,
                                right: 4,
                              ),
                              child: Text(currencies2),
                            ),
                          ),
                          value: currencies2,
                        );
                      }).toList(),
                      onChanged: (value) {
                        // ignore: avoid_print

                        setState(() {
                          _currencies2 = value;
                        });
                        child:
                        Text(_currencies2!);
                      },
                    ),
                    const SizedBox(height: 16.0),
                    Container(
                      child: TextFormField(
                        controller: _salary2Cont,
                        focusNode: salary2Focus,
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                          counter: 0.height,
                          hintText: ' حددالراتب ',
                          helperStyle: const TextStyle(fontSize: 16),
                          hintStyle:
                              TextStyle(color: Colors.black.withOpacity(0.2)),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blue.withOpacity(0.2),
                                width: 0.6),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(25.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(25.0)),
                            borderSide: BorderSide(
                                color: const Color.fromARGB(255, 232, 235, 238)
                                    .withOpacity(0.2),
                                width: 0.6),
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
                          setState(() {});
                        },
                        onSaved: (value) {
                          setState(() {});
                        },
                      ),
                    ).expand(),
                  ],
                ),
                const SizedBox(width: 10.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                  onPressed: _keyinformationsubmit2,
                  child: const Text("تسجيل"),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
