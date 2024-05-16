import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  CustomDialog({
    required this.title,
    required this.content,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      backgroundColor: Colors.white,
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          style: TextButton.styleFrom(foregroundColor: Colors.grey),
          onPressed: onCancel,
          child: Text('取消'),
        ),
        TextButton(
          style: TextButton.styleFrom(foregroundColor: Colors.orange),
          onPressed: onConfirm,
          child: Text('确定'),
        ),
      ],
    );
  }
}
