import 'package:flutter/material.dart';

class Step33 extends StatelessWidget {
  final String email;
  final String namejob;
  final String password;
  final String phon;
  final String user;

  const Step33({
    Key? key,
    required this.email,
    required this.namejob,
    required this.password,
    required this.phon,
    required this.user,
    required String nametestimonial,
    required String donortest,
    required String datetest,
    required String discriptest,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('بيانات المستخدم'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'الاسم كاملا:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(user, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10.0),
            const Text(
              'البريد الالكتروني:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(email, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10.0),
            const Text(
              'رقم الهاتف:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(phon, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10.0),
            const Text(
              'المسمى الوظيفي:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(namejob, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10.0),
            const Text(
              'كلمة المرور:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(password, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('العودة'),
            ),
          ],
        ),
      ),
    );
  }
}
