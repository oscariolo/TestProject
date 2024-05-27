import 'package:flutter/material.dart';

class CustomDateChooser extends StatefulWidget {
  final DateTime initialDate;
  final ValueChanged<DateTime>? onDateChanged;

  CustomDateChooser({
    final Key? key,
    required this.initialDate,
    this.onDateChanged,
  }) : super(key: key);

  @override
  State<CustomDateChooser> createState() => _CustomDateChooser();
}

class _CustomDateChooser extends State<CustomDateChooser> {
  TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dateController.text = widget.initialDate.toString().split(" ")[0];
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
      initialDate: widget.initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Theme.of(context).secondaryHeaderColor,
              onPrimary: Colors.white,
              surface: Theme.of(context).primaryColor,
              onSurface: Colors.black,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _dateController.text = picked.toString().split(" ")[0];
      });
      widget.onDateChanged!(picked);
    }
  }
}
