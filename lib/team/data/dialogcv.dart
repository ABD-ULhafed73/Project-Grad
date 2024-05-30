/*import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;

import 'formcv.dart';

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
*/