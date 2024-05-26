import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed;

  CustomFloatingActionButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: Theme.of(context).secondaryHeaderColor, width: 2.0),
        ),
        child: FloatingActionButton(
          onPressed: onPressed,
          backgroundColor: Theme.of(context).primaryColor,
          shape: CircleBorder(),
          child: Image.asset('lib/assets/icons/PlusIcon.png'),
        ),
      ),
    );
  }
}
