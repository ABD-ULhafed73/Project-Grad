import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:projectflutter/team/account/log.dart';

// ignore: camel_case_types
class pass1 extends StatefulWidget {
  const pass1({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _pass1State createState() => _pass1State();
}

// ignore: camel_case_types
class _pass1State extends State<pass1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Dialog(
          child: Column(
            children: [
              Stack(
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: Text('عوده', style: boldTextStyle(size: 14))
                          .onTap(() {
                        finish(context);
                      }).paddingOnly(right: 8, top: 8)),
                ],
              ),
              Column(
                children: [
                  Text('تغيير كلمة المرور', style: boldTextStyle(size: 18)),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        hintText: ' راجع بريدك الالكتروني',
                        helperStyle: const TextStyle(fontSize: 12),
                        hintStyle:
                            TextStyle(color: Colors.blue.withOpacity(0.2)),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        labelText: '  رمز إعادة تعيين',
                        prefixIcon: const Icon(Icons.keyboard)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      hintText: ' ',
                      helperStyle: const TextStyle(fontSize: 12),
                      hintStyle: TextStyle(color: Colors.blue.withOpacity(0.2)),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      labelText: ' كلمة المرور الجديدة ',
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: const Icon(Icons.remove_red_eye),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        hintText: ' ',
                        helperStyle: const TextStyle(fontSize: 12),
                        hintStyle:
                            TextStyle(color: Colors.blue.withOpacity(0.2)),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        labelText: ' تاكيد كلمة المرور',
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: const Icon(Icons.remove_red_eye)),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AuthThreePage(
                                    //  email: '',
                                    //password: '',
                                    )));
                      },
                      child: const Text('تغيير')),
                  16.height,
                  AppButton(
                    width: context.width(),
                  ).paddingOnly(left: 16, right: 16, bottom: 16),
                ],
              ).paddingAll(16),
            ],
          ),
        ),
      ),
    );
  }
}
