import 'package:flutter/material.dart';
import 'package:projectflutter/team/employ/employer1.dart';
import 'package:projectflutter/team/folder3/employer2.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
    if (item == 'قيمة1') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => employer1()));
    } else if (item == 'قيمة2') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => employer2()));
    }
    // على سبيل المثال، قم بالانتقال إلى صفحة جديدة وعرض محتوى العنصر
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DetailsPage(
                item: item,
              )),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Advanced Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) => filterData(value),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(width: 1, color: Colors.black87),
                ),
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
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
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () => openItem(context, item),
                  // يمكنك إضافة تنسيق مخصص للعناصر هنا
                  subtitle: Text('وصف العنصر هنا'),
                  leading: Icon(Icons.info),
                  trailing: Icon(Icons.arrow_forward),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final String item;

  DetailsPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تفاصيل العنصر'),
      ),
      body: Center(
        child: Text(
          item,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
/*
import 'package:flutter/material.dart';

class AdvancedSearch extends StatefulWidget {
  @override
  _AdvancedSearchState createState() => _AdvancedSearchState();
}

class _AdvancedSearchState extends State<AdvancedSearch> {
   String? industry;
   String? jobLevel;
   String? location;
  late int experience;
  late int salary;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Advanced Search'),
      ),
      body: Center(
        child: Column(
          children: [
            DropdownButton<String>(
              hint: Text('Select industry'),
              value: industry,
              onChanged: (value) {
                setState(() {
                  industry = value!;
                });
              },
              items: <String>['IT', 'Finance', 'Marketing', 'Engineering']
                  .map<DropdownMenuItem<String>>(( value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            DropdownButton<String>(
              hint: Text('Select job level'),
              value: jobLevel,
              onChanged: (value) {
                setState(() {
                  jobLevel = value!;
                });
              },
              items: <String>['Entry Level', 'Mid Level', 'Senior Level']
                  .map<DropdownMenuItem<String>>(( value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Enter location'),
              onChanged: ( value) {
                setState(() {
                  location = value;
                });
              },
            ),
            Slider(
              value: experience.toDouble(),
              min: 0,
              max: 10,
              divisions: 10,
              label: experience.toString(),
              onChanged: ( value) {
                setState(() {
                  experience = value.toInt();
                });
              },
            ),
            Slider(
              value: salary.toDouble(),
              min: 0,
              max: 50000,
              divisions: 50000,
              label: salary.toString(),
              onChanged: ( value) {
                setState(() {
                  salary = value.toInt();
                });
              },
            ),
          
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AdvancedSearch extends StatefulWidget {
  @override
  _AdvancedSearchState createState() => _AdvancedSearchState();
}

class _AdvancedSearchState extends State<AdvancedSearch> {
  String? industry;
  String? jobLevel;
  String? location;
  int? experience;
  int? salary;
  String? educationLevel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Advanced Search'),
      ),
      body: Center(
        child: Column(
          children: [
            DropdownButton<String>(
              hint: Text('Select industry'),
              value: industry,
              onChanged: (value) {
                setState(() {
                  industry = value;
                });
              },
              items: <String>['IT', 'Finance', 'Marketing', 'Engineering']
                  .map<DropdownMenuItem<String>>(( value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            DropdownButton<String>(
              hint: Text('Select job level'),
              value: jobLevel,
              onChanged: (value) {
                setState(() {
                  jobLevel = value;
                });
              },
              items: <String>['Entry Level', 'Mid Level', 'Senior Level']
                  .map<DropdownMenuItem<String>>(( value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Enter location'),
              onChanged: ( value) {
                setState(() {
                  location = value;
                });
              },
            ),
            Slider(
              value: experience!.toDouble(),
              min: 0,
              max: 10,
              divisions: 10,
              label: experience.toString(),
              onChanged: ( value) {
                setState(() {
                  experience = value.toInt();
                });
              },
            ),
            Slider(
              value: salary!.toDouble(),
              min: 0,
              max: 50000,
              divisions: 50000,
              label: salary.toString(),
              onChanged: ( value) {
                setState(() {
                  salary = value.toInt();
                });
              },
            ),
            DropdownButton<String>(
              hint: Text('Select education level'),
              value: educationLevel,
              onChanged: (value) {
                setState(() {
                  educationLevel = value;
                });
              },
              items: <String>['Diploma', 'Bachelor', 'Master', 'PhD']
                  .map<DropdownMenuItem<String>>(( value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: () {
                // Perform search
                print('Industry: $industry');
                print('Job Level: $jobLevel');
                print('Location: $location');
                print('Experience: $experience');
                print('Salary: $salary');
                print('Education Level: $educationLevel');
              },
              child: Text('Search'),
            ),
          ],
        ),
      ),
    );
  }
}
*/
