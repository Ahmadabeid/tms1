import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Document(),
    );
  }
}

class Document extends StatefulWidget {
  @override
  _DocumentState createState() => _DocumentState();
}

class _DocumentState extends State<Document> {
  File? _selectedFile;

  void _openFileExplorer() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );

    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    }
  }

  void _uploadFile() async {
    if (_selectedFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select a file first.')),
      );
      return;
    }

    var url = Uri.parse('http://localhost:8085/document/addDocument'); // Replace with your actual URL.

    var request = http.MultipartRequest('POST', url);

    request.fields['docName'] = 'Your Document Name'; // Replace with the actual document name.
    request.fields['docSize'] = _selectedFile!.lengthSync().toString(); // Use the file size from the selected file.

    request.files.add(http.MultipartFile(
      'docFile',
      _selectedFile!.readAsBytes().asStream(),
      _selectedFile!.lengthSync(),
      filename: _selectedFile!.path.split('/').last,
    ));

    var response = await request.send();

    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('File uploaded successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('File upload failed.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upload Document Form')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _openFileExplorer,
              child: Text('Select Document'),
            ),
            SizedBox(height: 16),
            if (_selectedFile != null)
              Text(
                'Selected File: ${_selectedFile!.path.split('/').last}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _uploadFile,
              child: Text('Upload Document'),
            ),
          ],
        ),
      ),
    );
  }
}
