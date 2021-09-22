import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController control;
  final String label;
  final String hint;
  final Icon? icon;

  Editor({
    required this.control,
    required this.label,
    required this.hint,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
      child: TextField(
        controller: control,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: icon != null ? icon : null,
          labelText: label,
          hintText: hint,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
