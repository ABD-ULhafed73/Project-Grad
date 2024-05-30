/*import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:projectflutter/team/data/page33data.dart';
import 'package:projectflutter/team/data/page34.dart';

import 'RegisterForm.dart';
import 'date.dart';
import 'showdata.dart';

class step33 extends StatefulWidget {
  const step33({
    super.key,
  });

  @override
  _step33State createState() => _step33State();
}

class _step33State extends State<step33> {
  final _formKey = GlobalKey<FormState>();
  var autoValidate = false;
  final TextEditingController _dateCont = TextEditingController();

  final _braithDateCont = TextEditingController();
  final _descrip2Cont = TextEditingController();

  final _dateFormatCont = DateFormat('dd/MM/yyyy');

  var braithDateFocus = FocusNode();
  var descrip2Focus = FocusNode();

  @override
  void dispose() {
    _braithDateCont.dispose();
    _descrip2Cont.dispose();

    super.dispose();
  }

  void _submit33() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Step33Details(
            braithDate: _braithDateCont.text,
            gender: _gender.toString(),
            address: _descrip2Cont.text,
            province: _prov2.toString(),
          ),
        ),
      );
    }
  }

  String? _gender;
  String? _selectedjobDescription2;
  String? _salary2;
  String? _prov2;

  final List<String> provinc = [
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    controller: _braithDateCont,
                    focusNode: braithDateFocus,
                    decoration: const InputDecoration(
                      hintText: 'تاريخ الميلاد',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                    ),
                    onTap: () async {
                      DateTime date = DateTime(1900);
                      FocusScope.of(context).requestFocus(new FocusNode());

                      date = (await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100)))!;
                      setState(() {
                        _braithDateCont.text = _dateFormatCont.format(date);
                      });
                    },
                  ),
                  const SizedBox(height: 16.0),
                  DropdownButtonFormField(
                    //  isDense: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      labelText: '(الجنس)النوع',
                      labelStyle: TextStyle(fontSize: 16),
                    ),
                    items: gender.map((gender) {
                      return DropdownMenuItem(
                        value: gender,
                        child: Text(gender),
                      );
                    }).toList(),
                    validator: (s) {
                      if (s!.isEmpty) {
                        return 'يرجاء ادخال  النوع(الجنس)';
                      } else if (!s.isNotEmpty) {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      setState(
                        () {
                          _gender = value!;
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField(
                    decoration: const InputDecoration(
                      labelText: 'المحافظة',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                    ),
                    items: provinc.map((provinc) {
                      return DropdownMenuItem(
                        value: provinc,
                        child: Text(provinc),
                      );
                    }).toList(),
                    validator: (s) {
                      if (s!.isEmpty) {
                        return ' يرجاء ادخال المحافظة ';
                      } else if (!s.isNotEmpty) {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      setState(() {
                        _prov2 = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _descrip2Cont,
                    focusNode: descrip2Focus,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      labelText: ' العنوان',
                      labelStyle: TextStyle(fontSize: 16),
                    ),
                    validator: (s) {
                      if (s!.isEmpty) {
                        return 'يرجاء ادخال العنوان ';
                      } else if (s.isNotEmpty) {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      setState(() {
                        _selectedjobDescription2 = value;
                      });
                    },
                    onSaved: (value) {
                      setState(() {
                        _selectedjobDescription2 = value!;
                      });
                    },
                    // maxLines: 3,
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    child: const Text("تسجيل"),
                    onPressed: _submit33,
                  ),
                ],
              ),
            ),
          ),
        )));
  }
}
*/