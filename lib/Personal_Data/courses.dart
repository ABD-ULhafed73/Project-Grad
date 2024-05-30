import 'package:flutter/material.dart';
import 'package:projectflutter/Personal_Data/skills.dart';

class parchment extends StatefulWidget {
  const parchment(
      {super.key,
      required String nametestimonial,
      required String donortest,
      required String datetest,
      required String discriptest});

  @override
  // ignore: library_private_types_in_public_api
  _parchmentState createState() => _parchmentState();
}

enum SingingCharacter { spaceEvenly, start, center }

class _parchmentState extends State<parchment> {
  final _formKey = GlobalKey<FormState>();
  final _nameparchmentCont = TextEditingController();
  final _donorparchmentCont = TextEditingController();
  final _dateparchmentCont = TextEditingController();
  final _discripeparchmentCont = TextEditingController();

  int? _selectendYear;
  int? _enddate;

  SingingCharacter _character = SingingCharacter.spaceEvenly;
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.spaceEvenly;

  @override
  void dispose() {
    _nameparchmentCont.dispose();
    _donorparchmentCont.dispose();
    _dateparchmentCont.dispose();
    _discripeparchmentCont.dispose();

    super.dispose();
  }

  void expertisesubmit() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => skills(),
        ),
      );
    }
  }

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
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Container(
                // color: Colors.green[50],
                child: Column(
                  mainAxisSize: MainAxisSize.min, // To make the card compact
                  children: <Widget>[
                    Text(
                      'الشهادات',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16.0),

                    TextFormField(
                      controller: _nameparchmentCont,
                      decoration: InputDecoration(
                        labelText: 'اسم الشهادة  ',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'يرجاء إدخال اسم الشهادة';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),

                    TextFormField(
                      controller: _donorparchmentCont,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        labelText: ' الجهة المانحة',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ' يرجاء إ دخال  الجهة المانحة';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),

                    ///years
                    TextFormField(
                      controller: _dateparchmentCont,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        labelText: ' التاريخ',
                        suffixIcon: DropdownButton<int>(
                          value: _selectendYear,
                          onChanged: (s) {
                            setState(() {
                              _selectendYear = s;
                              _dateparchmentCont.text = s.toString();
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
                          return ' يرجاء ادخال التاريخ';
                        } else if (!s.isNotEmpty) {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: _discripeparchmentCont,
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
