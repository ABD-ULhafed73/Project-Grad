import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class languages extends StatefulWidget {
  const languages({super.key, required String skills});

  @override
  State<languages> createState() => _languagesState();
}

class _languagesState extends State<languages> {
  final _briefCont = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _briefCont.dispose();

    super.dispose();
  }

  void _breifsubmit() {
    if (_formKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 8.9,
                ),
                AspectRatio(
                  aspectRatio: 20 / 5,
                  child: Container(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  controller: _briefCont,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    labelText: 'اللغة',
                  ),
                ),
                TextFormField(
                  controller: _briefCont,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    labelText: 'الاجادة',
                    hintMaxLines: 6,
                  ),
                ),
                ElevatedButton(
                    onPressed: _breifsubmit,
                    child: Text('<-استمر في بناء سيرنك الذايه '))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
