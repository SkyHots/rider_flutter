import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class PassQualificationUploadPage extends StatefulWidget {
  const PassQualificationUploadPage({super.key});

  @override
  _PassQualificationUploadPageState createState() =>
      _PassQualificationUploadPageState();
}

class _PassQualificationUploadPageState
    extends State<PassQualificationUploadPage> {
  PlatformFile? _selectedFile;

  void _selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _selectedFile = result.files.first;
      });
    }
  }

  void _uploadFile() {
    if (_selectedFile != null) {
      // 执行文件上传操作
      uploadFile(_selectedFile!);
    } else {
      // 未选择文件，进行相应处理
    }
  }

  Future<void> uploadFile(PlatformFile file) async {
    // 上传逻辑
    // ...
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('通行资质'),
      ),
      body: Container(
        color: Color(0xFFF8F8F8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '已通过',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Center(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/def.png',
                          height: 100.0,
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          '提示：请上传行证',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Text(
                    '通行资质有限期： 2024-03-11~2025-03-11',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                onPressed: () {
                  // 提交按钮点击事件
                },
                child: Text(
                  '提交',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
