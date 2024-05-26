import 'package:flutter/material.dart';
import 'package:namer_app/controller/editcreate_task_controller.dart';

class CustomDateChooser extends StatefulWidget {
  final EditcreateTaskController controller;

  CustomDateChooser({
    final Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<CustomDateChooser> createState() => _CustomDateChooser();
}

class _CustomDateChooser extends State<CustomDateChooser> {
  TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dateController.text = widget.controller.dateTime.toString().split(" ")[0];
  }

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
      initialDate: widget.controller.dateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = picked.toString().split(" ")[0];
        widget.controller.dateTime = picked;
      });
    }
  }
}
