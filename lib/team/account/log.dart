import 'package:flutter/material.dart';
//import 'package:assesst/img/facebook.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../main.dart';
import '../../screen/home/components/home_job/components/employer.dart';
import '../data/dialog2.dart';
import '../data/showdata.dart';
import '../employ/employer.dart';
import '../folder3/employer2.dart';

import '../steps/jobseekersignup.dart';
import '../steps/keyInformation.dart';
import 'changepass.dart';

class AuthThreePage extends StatefulWidget {
  static const String path = "lib/src/pages/login/auth3.dart";

  const AuthThreePage({super.key});

  @override
  _AuthThreePageState createState() => _AuthThreePageState();
}

class _AuthThreePageState extends State<AuthThreePage> {
  String? _name3;
  List<String> dataList = [
    'قيمة1',
    'قيمة2',
    'قيمة3',
    // ... قائمة بيانات أخرى
  ];

  List<String> filteredList = [];

  void filterData(String searchQuery) {
    setState(() {
      if (searchQuery.isEmpty) {
        filteredList = [];
      } else {
        filteredList = dataList
            .where((item) =>
                item.toLowerCase().contains(searchQuery.toLowerCase()))
            .toList();
      }
    });
  }

  void openItem(BuildContext context, String item) {
    // تنفيذ الإجراء المطلوب عند النقر على العنصر هنا
    // على سبيل المثال، قم بالانتقال إلى صفحة جديدة وعرض محتوى العنصر
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => employer(item: item)),
    );
  }

  final String backImg = 'assesst/img/class18.jpg';
  late bool formVisible;
  int? _formsIndex;

  @override
  void initState() {
    super.initState();
    formVisible = false;
    _formsIndex = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search',
              style: TextStyle(
                fontSize: 30, // color: isHovered ? Colors.red : Colors.black),
              )),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: Searchpage());
              },
              icon: const Icon(Icons.search),
            ),
          ],
          elevation: 4.0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.topCenter,
              colors: [Colors.black, Colors.white, Colors.blue],
            )),
          ),
          toolbarHeight: 80,
          automaticallyImplyLeading: false,
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assesst/img/class18.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: <Widget>[
              Container(
                // color: Colors.black54,
                child: Column(
                  children: <Widget>[
                    // const SizedBox(height: kToolbarHeight + 1),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          const Text(
                            "Welcome",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 30.0,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TextField(
                              onChanged: (value) => filterData(value),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: const BorderSide(
                                      width: 1, color: Colors.black87),
                                ),
                                labelText: 'Search',
                                prefixIcon: const Icon(Icons.search),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: filteredList.length,
                              itemBuilder: (context, index) {
                                String item = filteredList[index];
                                return ListTile(
                                  title: Text(
                                    item,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onTap: () => openItem(context, item),
                                  // يمكنك إضافة تنسيق مخصص للعناصر هنا
                                  subtitle: const Text('وصف العنصر هنا'),
                                  leading: const Icon(Icons.info),
                                  trailing: const Icon(Icons.arrow_forward),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      children: <Widget>[
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            child: const Text("صاحب العمل"),
                            onPressed: () {
                              setState(() {
                                formVisible = true;
                                _formsIndex = 1;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey.shade700,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            child: const Text("الباحث عن وظيفة"),
                            onPressed: () {
                              setState(() {
                                formVisible = true;
                                _formsIndex = 2;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 10.0),
                      ],
                    ),
                  ],
                ),
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: (!formVisible)
                    ? null
                    : Container(
                        color: Colors.black54,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: _formsIndex == 1
                                        ? Colors.white
                                        : Colors.black,
                                    backgroundColor: _formsIndex == 1
                                        ? Colors.red
                                        : Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                  ),
                                  child: const Text("صاحب العمل"),
                                  onPressed: () {
                                    setState(() {
                                      _formsIndex = 1;
                                    });
                                  },
                                ),
                                const SizedBox(width: 10.0),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: _formsIndex == 2
                                        ? Colors.white
                                        : Colors.black,
                                    backgroundColor: _formsIndex == 2
                                        ? Colors.red
                                        : Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                  ),
                                  child: const Text("الباحث عن وظيفة"),
                                  onPressed: () {
                                    setState(() {
                                      _formsIndex = 2;
                                    });
                                  },
                                ),
                                const SizedBox(width: 10.0),
                                IconButton(
                                  color: Colors.white,
                                  icon: const Icon(Icons.clear),
                                  onPressed: () {
                                    setState(() {
                                      formVisible = false;
                                    });
                                  },
                                )
                              ],
                            ),
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              child: _formsIndex == 1
                                  ? LoginForm()
                                  : const SignupForm(),
                            )
                          ],
                        ),
                      ),
              )
            ],
          ),
        ));
  }
}

class LoginForm extends StatelessWidget {
  final _emaillogin = TextEditingController();
  final _passwordlogin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          TextField(
            controller: _emaillogin,
            decoration: const InputDecoration(
              hintText: "ادخل البريد الالكتروني",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
            onChanged: (value) {},
          ),
          const SizedBox(height: 10.0),
          TextField(
            controller: _passwordlogin,
            obscureText: true,
            decoration: const InputDecoration(
              hintText: "ادخل كلمة المرور",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
            onChanged: (value) {},
          ),
          const SizedBox(height: 10.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            child: const Text("دخول"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => employer2()),
                ),
              );
            },
          ),
          const SizedBox(
            height: 20,
            width: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const forgetpass()),
                      ));
                },
                child: const Text(
                  'نسيت كلمة المرور؟',
                ),
              ),
              const SizedBox(
                width: 150,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const jobseekersignup(
                            item: '',
                          )),
                    ),
                  );
                },
                child: const Text(
                  'ليس لديك حساب؟',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SignupForm extends StatelessWidget {
  const SignupForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          const TextField(
            decoration: InputDecoration(
              hintText: "ادخل البريد الالكتروني",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          const TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "ادخل كلمة المرور",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          const TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "إعادة كلمة المرور",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 114, 112, 241),
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            child: const Text("تسجيل"),
            onPressed: () {
              /* Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => RegForm(
                        des: '',
                        exp: '',
                        emp: '',
                        prov2: '',
                        namejob: '',
                        phon: '',
                        sal: '',
                        user: '',
                      )),
                ),
              );*/
            },
          ),
          const SizedBox(height: 40.0),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.red),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            icon: const Icon(FontAwesomeIcons.google),
            label: const Text("تسجيل بواسطة جوجل"),
            onPressed: () {},
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
