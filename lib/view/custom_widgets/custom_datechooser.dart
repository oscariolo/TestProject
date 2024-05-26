import 'dart:math';

import 'package:flutter/material.dart';

class CustomDateChooser extends StatefulWidget {
  final DateTime initialDate;
  final ValueChanged<DateTime> onDateChanged;

  CustomDateChooser({
    final Key? key,
    required this.initialDate,
    required this.onDateChanged,
  }) : super(key: key);

  @override
  State<CustomDateChooser> createState() => _CustomDateChooser();
}

class _CustomDateChooser extends State<CustomDateChooser> {
  TextEditingController _dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _dateController,
      style: TextStyle(color: Colors.black),
      decoration: const InputDecoration(
        labelText: 'Fecha',
        filled: true,
        prefixIcon: Icon(Icons.calendar_today),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF397BE6)),
        ),
      ),
      readOnly: true,
      onTap: () {
        _selectDate();
      },
    );
  }

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = picked.toString().split(" ")[0];
        widget.onDateChanged(picked);
      });
    }
  }
}
