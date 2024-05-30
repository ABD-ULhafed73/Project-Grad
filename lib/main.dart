import 'package:flutter/material.dart';
import 'package:projectflutter/screen/home/home_screen.dart';
import 'package:projectflutter/team/account/log.dart';
import 'package:projectflutter/team/data/firstStep.dart';
import 'package:projectflutter/team/data/page22.dart';
import 'package:projectflutter/team/data/page33.dart';
import 'package:projectflutter/team/data/page34.dart';
import 'package:projectflutter/team/steps/dialogcv.dart';
import 'package:projectflutter/team/steps/jobseekersignup.dart';
import 'Personal_Data/brief.dart';
import 'screen/home/components/home_job/components/catorgy_diff.dart';

//import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();

  //MobileAds.instance.initialize();
  runApp(const MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter demo ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Cairo',
      ),
      home: HomeScreen(),
      /* 
      
      
      
       initialRoute: "/",
      routes: {
        "/": (context) => const HomeScreen(),
        "/catorgy_diff": (context) => const catorgy_job(press: () {  }, catorgyi: null,),
      },*/
    );
  }
}

class Searchpage extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AuthThreePage(
                  //  email: '',
                  //password: '',
                  )),
        );
        // ignore: cast_from_null_always_fails
        close(context, null as String);
      },
      icon: const Icon(
        Icons.arrow_back,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Center(
      child: Text('ccc'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List suggestionList;
    if (query.isEmpty) {
      suggestionList = [];
    } else {
      suggestionList = [
        'صاحب العمل',
        'باحث',
      ]
          .where((element) =>
              element.toLowerCase().startsWith(query.toLowerCase()))
          .toList();
    }
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(suggestionList[index]),
          onTap: () {
            query = suggestionList[index];
            showResults(context);
          },
        );
      },
    );
  }
}
