// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:projectflutter/team/folder3/page2.dart';
import 'package:projectflutter/team/folder3/settings/page.dart';

import '../../main.dart';
import '../account/log.dart';
import '../employ/new_job.dart';

class employer2 extends StatefulWidget {
  employer2({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _employer2State createState() => _employer2State();
  final _formKey = GlobalKey<FormState>();
  final formKey = GlobalKey<FormState>();
  final TextEditingController _fdate = TextEditingController();

  var autoValidate = false;
}

String? _Fdate;

String? _selectedjobTitle;
// ignore: unused_field
String? _selectedjobDescription;
String? _selectedjobType;
String? _selectedjobLevel;
String? _selectedGovernorate;

class _employer2State extends State<employer2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'بحث',
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: Searchpage());
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: <Widget>[
                Container(
                  height: 180.0,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 74, 56, 238),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10.0,
                        offset: Offset(0.0, 50.0),
                      ),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      const Text(
                        'احصل على باقة توظيف متميزة',
                        style: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.normal,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        ' ستصل اعلاناتك الوظيفية الى ملايين الباحثين عن عمل',
                        style: TextStyle(
                            fontStyle: FontStyle.normal, color: Colors.white),
                      ),
                      const TextButton(
                        onPressed: null,
                        child: Text(
                          'احصل عليها الان',
                          style: TextStyle(
                              fontStyle: FontStyle.normal, color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => tablecard()));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                        color: Colors.brown,
                        child: const Text(
                          'شراء باقة جديدة',
                          style: TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.normal,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NewJob()));
                      },
                      child: const Text('إضافة اعلان وضيفه',
                          style: TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.normal,
                              color: Colors.black)),
                    ),
                    const SizedBox(
                      width: 90,
                      height: 40,
                    ),
                    MaterialButton(
                      focusColor: Colors.green,
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0)),
                      color: Colors.orange,
                      child: const Text('نشطة',
                          style: TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.normal,
                              color: Colors.black)),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0)),
                      color: Colors.orange,
                      child: const Text(
                        'منتهية',
                        style: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.normal,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 180.0,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    //color: Color.fromARGB(255, 74, 56, 238),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      //  mainAxisAlignment: MainAxisAlignment.center,

                      Text('$_selectedjobLevel'),
                      VerticalDivider(),
                      SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          Text(' $_Fdate '),
                          VerticalDivider(),
                          Text(' $_selectedGovernorate'),
                          VerticalDivider(),
                          Text(' $_selectedjobType'),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: <Widget>[
                          Text('Governorate: $_selectedjobTitle'),
                          VerticalDivider(),
                          Text('Currency: $_selectedjobDescription'),
                          VerticalDivider(),
                          Text('Employee Type: $_selectedjobType'),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: AlignmentDirectional.centerStart,
                  height: 450.0,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(137, 255, 255, 255),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10.0,
                        offset: Offset(0.0, 0.0),
                      ),
                    ],
                  ),
                  child: ListView(
                    controller: ScrollController(),
                    // mainAxisAlignment: MainAxisAlignment.start,
                    //  crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(
                          Icons.shopping_cart_rounded,
                        ),
                        title: Text(
                          'إعلانات الوظائف',
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.add_shopping_cart),
                        title: Text(
                          ' اضافة إعلان الوظائف',
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewJob()));
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.search),
                        title: Text(
                          'البحث في السير الذاتيه ',
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.folder),
                        title: Text(
                          ' مجلدات السير الذاتيه ',
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.dataset_linked),
                        title: Text(
                          'تعديل بيانات الشركه ',
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.foundation),
                        title: Text(
                          ' صفحة الشركة',
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.shopping_bag),
                        title: Text(
                          '  باقات التوظيف',
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.settings),
                        title: Text(
                          '  الاعدادات',
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => setting()));
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.logout),
                        title: Text(
                          ' تسجيل خروج ',
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AuthThreePage(
                                      //  email: '',
                                      //password: '',
                                      )));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
