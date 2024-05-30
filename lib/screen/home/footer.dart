import 'package:flutter/material.dart';

class Filter extends StatelessWidget {
  const Filter({
    Key? key,
  }) : super(key: key);
  /* final GlobalKey<FormFieldState<String>> _passwordFieldKey =
      GlobalKey<FormFieldState<String>>();
  String? _email;
  String? _password;
  String? _valdiateName(String? value) {
    if (value?.isEmpty ?? false) {
      return 'Name is required';
    }
    final RegExp nameExp = RegExp(r'^[A-Za-z]+$');
    if (!nameExp.hasMatch(value!)) {
      return 'please enter only alphabetical charcters.';
    }
    return null;
  } */

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Text(
                    "للتواصل ",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Text("من نحن ", style: TextStyle(color: Colors.white)),
              Container(
                margin: EdgeInsets.only(top: 7),
                child: ElevatedButton(
                    onPressed: () {
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => SimpleDialog(
                                titleTextStyle: TextStyle(
                                    fontFamily: 'Cairo', fontSize: 20),
                                title: const Text(
                                  'تسجيل الدخول ',
                                  textAlign: TextAlign.right,
                                ),
                                children: <Widget>[
                                  Container(
                                    width: 200,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Email',
                                        prefixIcon: Icon(
                                          Icons.email,
                                          //color: Colors.blue,
                                        ),

                                        hintText: "Your Email :",
                                        // border: InputBorder.none
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Container(
                                    width: 200,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Password',
                                        prefixIcon: Icon(
                                          Icons.lock,
                                          // color: Colors.blue,
                                        ),
                                        suffixIcon: Icon(Icons.visibility),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ElevatedButton(
                                                onPressed: () {},
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty.all(
                                                            Colors.blue),
                                                    padding:
                                                        MaterialStateProperty.all(
                                                            EdgeInsets.symmetric(
                                                                horizontal: 30,
                                                                vertical: 10)),
                                                    shape: MaterialStateProperty.all(
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    20)))),
                                                child: Text(" دخول ",
                                                    style:
                                                        TextStyle(color: Colors.white))),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ));
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)))),
                    child: Text("تسجيل الدخول ",
                        style: TextStyle(color: Colors.white))),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Text("الحقوق محفوظة لـ فرص 2023@",
                      style: TextStyle(color: Colors.white))
                ],
              ),
              Text(" سياسية الخصوصية", style: TextStyle(color: Colors.white))
            ],
          )
        ],
      ),
    );
  }
}

/* class PasswordField extends StatefulWidget {
  const PasswordField({
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
  });

  final Key? fieldKey;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.fieldKey,
      obscureText: _obscureText,
      maxLength: 8,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        filled: true,
        hintText: widget.hintText,
        labelText: widget.labelText,
        helperText: widget.helperText,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
        ),
      ),
    );
  }
}
 */