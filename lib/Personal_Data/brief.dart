import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:projectflutter/Personal_Data/qualifications.dart';

class dialogbrief extends StatefulWidget {
  const dialogbrief({super.key});

  @override
  State<dialogbrief> createState() => _dialogbriefState();
}

class _dialogbriefState extends State<dialogbrief> {
  final _briefCont = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _briefCont.dispose();

    super.dispose();
  }

  void _breifsubmit() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => qualifications(brief: _briefCont.text),
        ),
      );
    }
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
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.only(top: 60),
                  alignment: Alignment.topCenter,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  ),
                  child: TextFormField(
                    controller: _briefCont,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        labelText:
                            '*اضف ملخص خبرتك المهنية ومهاراتك في بيئة العمل والوظيفة التي تبحث عنها '),
                    maxLines: 6,
                    minLines: 3,
                  ),
                ),
                SizedBox(
                  height: 10,
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
