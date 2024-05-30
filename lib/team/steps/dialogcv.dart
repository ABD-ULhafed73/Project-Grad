/*import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;

import '../../Personal_Data/scientific_expertise.dart';

class cccv extends StatefulWidget {
  @override
  _cccvState createState() => _cccvState();
}

class _cccvState extends State<cccv> {
  String? selectedFileName;
  Uint8List? selectedFileBytes;
  bool isFileSaved = false;
  String? _selectedLanguage;
  Future<void> _pickPDFFile(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      // maxSize: 5 * 1024 * 1024, // حجم الملف يجب أن لا يتجاوز 5 ميجا بايت
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      setState(() {
        selectedFileName = file.name;
        selectedFileBytes = file.bytes;
        isFileSaved = false;
      });
    } else {
      setState(() {
        selectedFileName = null;
        selectedFileBytes = null;
        isFileSaved = false;
      });
    }
  }

  void _saveFile() async {
    if (selectedFileBytes != null) {
      // يمكنك إضافة رمز الحفظ هنا (على سبيل المثال، استخدم مكتبة path_provider لحفظ الملف في مسار محدد)
      // await SomeSaveMethod(selectedFileBytes);

      // عرض رسالة للتأكيد عند الحفظ
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('تم حفظ الملف'),
            content: Text('تم حفظ الملف بنجاح.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    isFileSaved = true;
                  });
                },
                child: Text('حسنًا'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(''),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => _pickPDFFile(context),
              child: Container(
                margin: EdgeInsets.all(30),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                decoration: BoxDecoration(
                  border: Border.all(width: 5.0, color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    DropdownButtonFormField<String>(
                      value: _selectedLanguage,
                      decoration: InputDecoration(
                        labelText: 'اختر لغة',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _selectedLanguage = value;
                        });
                      },
                      items: <String>[
                        'English',
                        'Arabic',
                        'French',
                        'Spanish'
                      ] //قائمة اللغات المتاحة
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'انقر هنا لتحميل ملف PDF',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => LRow()));
                      },
                      child: Text('إنشاء cv'),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            selectedFileName != null
                ? Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              selectedFileName!,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 10),
                            isFileSaved
                                ? const Text(
                                    'تم حفظ ملف CV',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 16,
                                    ),
                                  )
                                : ElevatedButton(
                                    onPressed: _saveFile,
                                    child: Text('حفظ الملف'),
                                  ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
////////////////////////////
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<File> _files = [];

  Future<void> _pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        _files.add(File(result.files.single.path!));
      });
    }
  }

  Future<void> _saveFiles() async {
    final db = await openDatabase(
      join(await getDatabasesPath(), 'pdf_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE pdfs(id INTEGER PRIMARY KEY, name TEXT, path TEXT)',
        );
      },
      version: 1,
    );

    for (final file in _files) {
      final name = basename(file.path);
      final path = await file.copy(join(await getApplicationDocumentsDirectory().path, name));

      await db.insert(
        'pdfs',
        {
          'name': name,
          'path': path.path,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Files saved successfully!')),
    );
  }

  Future<void> _createCV() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => CVPage()),
    );
  }

  Future<List<Map<String, dynamic>>> _getSavedFiles() async {
    final db = await openDatabase(
      join(await getDatabasesPath(), 'pdf_database.db'),
    );

    final List<Map<String, dynamic>>> maps = await db.query('pdfs');

    return maps;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF and CV'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _pickFiles,
              child: Text('Pick Files'),
            ),
            SizedBox(height: 16),
            Expanded(
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: _getSavedFiles(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else {
                    final List<Map<String, dynamic>> maps = snapshot.data!;
                    final files = List.generate(
                      maps.length,
                      (i) => File(maps[i]['path']),
                    );

                    return ListView.builder(
                      itemCount: files.length,
                      itemBuilder: (context, index) {
                        final file = files[index];
                        return ListTile(
                          title: Text(basename(file.path)),
                          trailing: IconButton(
                            icon: Icon(Icons.remove_circle),
                            onPressed: () async {
                              final db = await openDatabase(
                                join(await getDatabasesPath(), 'pdf_database.db'),
                              );

                              await db.delete(
                                'pdfs',
                                where: 'path = ?',
                                whereArgs: [file.path],
                              );

                              setState(() {
                                files.removeAt(index);
                              });
                            },
                          ),
                          onTap: () {
                            // add your code to open the PDF file
                          },
                        );
                      },
                    );
                  }
                },
              ),
            ),
            ElevatedButton(
              onPressed: _saveFiles,
              child: Text('Save Files'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _createCV,
              child: Text('Create CV'),
            ),
          ],
        ),
      ),
    );
  }
}
//////////////////////// 
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<File> _files = [];

  Future<void> _pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        _files.add(File(result.files.single.path!));
      });
    }
  }

  Future<void> _saveFiles() async {
    final db = await openDatabase(
      join(await getDatabasesPath(), 'pdf_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE pdfs(id INTEGER PRIMARY KEY, name TEXT, path TEXT)',
        );
      },
      version: 1,
    );

    for (final file in _files) {
      final name = basename(file.path);
      final path = await file.copy(join(await getApplicationDocumentsDirectory().path, name));

      await db.insert(
        'pdfs',
        {
          'name': name,
          'path': path.path,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Files saved successfully!')),
    );
  }

  Future<void> _createCV() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => CVPage()),
    );
  }

  Future<List<Map<String, dynamic>>> _getSavedFiles() async {
    final db = await openDatabase(
      join(await getDatabasesPath(), 'pdf_database.db'),
    );

    final List<Map<String, dynamic>>> maps = await db.query('pdfs');

    return maps;
  }

  Future<void> _downloadFile(File file) async {
    final bytes = await file.readAsBytes();
    final blob = html.Blob([bytes]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.document.createElement('a') as html.AnchorElement
      ..href = url
      ..download = basename(file.path);
    html.document.body?.append(anchor);
    anchor.click();
    html.Url.revokeObjectUrl(url);
    anchor.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF and CV'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _pickFiles,
              child: Text('Pick Files'),
            ),
            SizedBox(height: 16),
            Expanded(
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: _getSavedFiles(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else {
                    final List<Map<String, dynamic>> maps = snapshot.data!;
                    final files = List.generate(
                      maps.length,
                      (i) => File(maps[i]['path']),
                    );

                    return ListView.builder(
                      itemCount: files.length,
                      itemBuilder: (context, index) {
                        final file = files[index];
                        return ListTile(
                          title: Text(basename(file.path)),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove_circle),
                                onPressed: () async {
                                  final db = await openDatabase(
                                    join(await getDatabasesPath(), 'pdf_database.db'),
                                  );

                                  await db.delete(
                                    'pdfs',
                                    where: 'path = ?',
                                    whereArgs: [file.path],
                                  );

                                  setState(() {
                                    files.removeAt(index);
                                  });
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.download),
                                onPressed: () => _downloadFile(file),
                              ),
                            ],
                          ),
                          onTap: () {
                            // add your code to open the PDF file
                          },
                        );
                      },
                    );
                  }
                },
              ),
            ),
            ElevatedButton(
              onPressed: _saveFiles,
              child: Text('Save Files'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _createCV,
              child: Text('Create CV'),
            ),
          ],
        ),
      ),
    );
  }
}
////////////////////////////////////////////
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<File> _files = [];

  Future<void> _pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        _files.add(File(result.files.single.path!));
      });
    }
  }

  Future<void> _saveFiles() async {
    final db = await openDatabase(
      join(await getDatabasesPath(), 'pdf_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE pdfs(id INTEGER PRIMARY KEY, name TEXT, path TEXT)',
        );
      },
      version: 1,
    );

    for (final file in _files) {
      final name = basename(file.path);
      final path = await file.copy(join(await getApplicationDocumentsDirectory().path, name));

      await db.insert(
        'pdfs',
        {
          'name': name,
          'path': path.path,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Files saved successfully!')),
    );
  }

  Future<void> _createCV() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => CVPage()),
    );
  }

  Future<List<Map<String, dynamic>>> _getSavedFiles() async {
    final db = await openDatabase(
      join(await getDatabasesPath(), 'pdf_database.db'),
    );

    final List<Map<String, dynamic>>> maps = await db.query('pdfs');

    return maps;
  }

  Future<void> _deleteFile(File file) async {
    final db = await openDatabase(
      join(await getDatabasesPath(), 'pdf_database.db'),
    );

    await db.delete(
      'pdfs',
      where: 'path = ?',
      whereArgs: [file.path],
    );

    setState(() {
      _files.remove(file);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('File deleted successfully!')),
    );
  }

  Future<void> _confirmDeleteFile(File file) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirm Deletion'),
          content: Text('Are you sure you want to delete this file?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text('Delete'),
            ),
          ],
        );
      },
    );

    if (confirmed != null && confirmed) {
      await _deleteFile(file);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF and CV'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _pickFiles,
              child: Text('Pick Files'),
            ),
            SizedBox(height: 16),
            Expanded(
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: _getSavedFiles(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else {
                    final List<Map<String, dynamic>> maps = snapshot.data!;
                    final files = List.generate(
                      maps.length,
                      (i) => File(maps[i]['path']),
                    );

                    return ListView.builder(
                      itemCount: files.length,
                      itemBuilder: (context, index) {
                        final file = files[index];
                        return ListTile(
                          title: Text(basename(file.path)),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove_circle),
                                onPressed: () =>_confirmDeleteFile(file),
                              ),
                              IconButton(
                                icon: Icon(Icons.download),
                                onPressed: () => _downloadFile(file),
                              ),
                            ],
                          ),
                          onTap: () {
                            // add your code to open the PDF file
                          },
                        );
                      },
                    );
                  }
                },
              ),
            ),
            ElevatedButton(
              onPressed: _saveFiles,
              child: Text('Save Files'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _createCV,
              child: Text('Create CV'),
            ),
          ],
        ),
      ),
    );
  }
}
*/
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class insertcv extends StatefulWidget {
  @override
  _insertcvState createState() => _insertcvState();
}

class _insertcvState extends State<insertcv> {
  List<File> _files = [];

  Future<void> _pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        _files.add(File(result.files.single.path!));
      });
    }
  }

  Future<void> _saveFiles() async {
    final db = await openDatabase(
      join(await getDatabasesPath(), 'pdf_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE pdfs(id INTEGER PRIMARY KEY, name TEXT, path TEXT)',
        );
      },
      version: 1,
    );

    for (final file in _files) {
      final name = basename(file.path);
      final path = await file
          .copy(join(await getApplicationDocumentsDirectory().path, name));

      await db.insert(
        'pdfs',
        {
          'name': name,
          'path': path.path,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    ScaffoldMessenger.of(context as BuildContext).showSnackBar(
      SnackBar(content: Text('Files saved successfully!')),
    );
  }

  Future<void> _createCV() async {
    Navigator.push(
      context as BuildContext,
      MaterialPageRoute(builder: (_) => CVPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF and CV'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _pickFiles,
              child: Text('Pick Files'),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _files.length,
                itemBuilder: (context, index) {
                  final file = _files[index];
                  return ListTile(
                    title: Text(basename(file.path)),
                    trailing: IconButton(
                      icon: Icon(Icons.remove_circle),
                      onPressed: () {
                        setState(() {
                          _files.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: _saveFiles,
              child: Text('Save Files'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _createCV,
              child: Text('Create CV'),
            ),
          ],
        ),
      ),
    );
  }

  getApplicationDocumentsDirectory() {}
}

class CVPage extends StatefulWidget {
  @override
  _CVPageState createState() => _CVPageState();
}

class _CVPageState extends State<CVPage> {
  List<File> _files = [];

  Future<void> _loadFiles() async {
    final db = await openDatabase(
      join(await getDatabasesPath(), 'pdf_database.db'),
    );

    final List<Map<String, dynamic>> maps = await db.query('pdfs');

    setState(() {
      _files = List.generate(
        maps.length,
        (i) => File(maps[i]['path']),
      );
    });
  }

  @override
  void initState() {
    _loadFiles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CV'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your PDF Files:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _files.length,
                itemBuilder: (context, index) {
                  final file = _files[index];
                  return ListTile(
                    title: Text(basename(file.path)),
                    leading: Icon(Icons.picture_as_pdf),
                    onTap: () {
                      // add your code to open the PDF file
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
