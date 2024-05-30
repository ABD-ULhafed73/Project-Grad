import 'package:flutter/material.dart';
import 'package:projectflutter/team/steps/page22data.dart';

import 'courses.dart';

class Testimonial extends StatefulWidget {
  const Testimonial(
      {Key? key,
      required String experjobname,
      required String expercomanyname,
      required String expercomanyplace,
      required TextEditingValue experofdate,
      required TextEditingValue expertodate,
      required String brief});
  @override
  _TestimonialState createState() => _TestimonialState();
}

enum SingingCharacter { spaceEvenly, start, center }

class _TestimonialState extends State<Testimonial> {
  final _formKey = GlobalKey<FormState>();
  final _nametestimonialController = TextEditingController();
  final _donortestController = TextEditingController();
  final _testimonialdateController = TextEditingController();
  final _testimonialdiscripedController = TextEditingController();

  @override
  void dispose() {
    _nametestimonialController.dispose();
    _donortestController.dispose();
    _testimonialdateController.dispose();
    _testimonialdiscripedController.dispose();

    super.dispose();
  }

  void _testimonialsubmit() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => parchment(
            nametestimonial: _nametestimonialController.text,
            donortest: _donortestController.text,
            datetest: _testimonialdateController.text,
            discriptest: _testimonialdiscripedController.text,
          ),
        ),
      );
    }
  }

  int? _selectedYear;
  int? _selectedMonth;

  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.spaceEvenly;

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
                      'الدورات التعليمية',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16.0),

                    TextFormField(
                      controller: _nametestimonialController,
                      decoration: InputDecoration(
                        labelText: 'اسم الدورة  ',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'يرجاء إدخال اسم الدورة';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),

                    TextFormField(
                      controller: _donortestController,
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

                    ///years
                    const SizedBox(height: 16.0),

                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: 'سنة الانتهاء من التخرج',
                        prefixIcon: Icon(Icons.calendar_today),
                        suffixIcon: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            DropdownButton<int>(
                              value: _selectedYear,
                              onChanged: (year) {
                                setState(() {
                                  _selectedYear = year;
                                });
                              },
                              items: List.generate(50, (i) => i + 1980)
                                  .map<DropdownMenuItem<int>>((year) {
                                return DropdownMenuItem<int>(
                                  value: year,
                                  child: Text(year.toString()),
                                );
                              }).toList(),
                            ),
                            SizedBox(width: 16),
                            DropdownButton<int>(
                              value: _selectedMonth,
                              onChanged: (month) {
                                setState(() {
                                  _selectedMonth = month;
                                });
                              },
                              items: List.generate(12, (i) => i + 1)
                                  .map<DropdownMenuItem<int>>((month) {
                                return DropdownMenuItem<int>(
                                  value: month,
                                  child: Text(month.toString()),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      validator: (value) {
                        if (_selectedYear == null || _selectedMonth == null) {
                          return 'يرجى اختيار سنة وشهر الانتهاء من التخرج';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: _testimonialdiscripedController,
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
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                      child: const Text("تسجيل"),
                      onPressed: _testimonialsubmit,
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
