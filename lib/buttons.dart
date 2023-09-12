import 'package:flutter/material.dart';

class myButton extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;
  final buttonTaaped;

  myButton(
      {required this.color,
      required this.buttonText,
      required this.textColor,
      required this.buttonTaaped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTaaped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(color: textColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
