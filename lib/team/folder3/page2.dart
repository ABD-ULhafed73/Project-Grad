import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class tablecard extends StatefulWidget {
  const tablecard({super.key});

  @override
  State<tablecard> createState() => _tablecardState();
}

class _tablecardState extends State<tablecard> {
  var _currentValue;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            children: <Widget>[
              CupertinoSegmentedControl(
                children: const <int, Widget>{
                  0: ChildIcon(
                    " شهر",
                  ),
                  1: ChildIcon(" شهور 3"),
                  2: ChildIcon("شهر 6"),
                },
                onValueChanged: (value) {
                  _currentValue = value;
                },
                groupValue: _currentValue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChildIcon extends StatelessWidget {
  final String text;
  const ChildIcon(this.text);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Text(text),
    );
  }
}

class datat extends StatefulWidget {
  const datat(String s, {super.key});

  @override
  State<datat> createState() => _datatState();
}

class _datatState extends State<datat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(6),
            child: Column(
              children: [
                DataTable(
                  sortColumnIndex: 1,
                  sortAscending: false,
                  columns: const [
                    DataColumn(
                      label: Text("prace"),
                    ),
                    DataColumn(label: Text("Likes"), numeric: true),
                    DataColumn(label: Text("Mascot")),
                  ],
                  rows: [
                    DataRow(
                      cells: [
                        DataCell(
                          Wrap(
                            spacing: 6,
                            children: const [
                              Text("USD 399"),
                            ],
                          ),
                        ),
                        const DataCell(Text("USD 150")),
                        const DataCell(Text("USD 100")),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class monthsix extends StatefulWidget {
  const monthsix(String s, {super.key});

  @override
  State<monthsix> createState() => _monthsixState();
}

class _monthsixState extends State<monthsix> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(6),
            child: Column(
              children: [
                DataTable(
                  sortColumnIndex: 1,
                  sortAscending: false,
                  columns: const [
                    DataColumn(
                      label: Text("prace"),
                    ),
                    DataColumn(label: Text("Likes"), numeric: true),
                    DataColumn(label: Text("Mascot")),
                  ],
                  rows: [
                    DataRow(
                      cells: [
                        DataCell(
                          Wrap(
                            spacing: 6,
                            children: const [
                              Text("USD 399"),
                            ],
                          ),
                        ),
                        const DataCell(Text("USD 150")),
                        const DataCell(Text("USD 100")),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
