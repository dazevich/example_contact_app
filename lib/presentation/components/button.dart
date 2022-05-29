import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Color textColor;
  final Color backgroundColor;
  final VoidCallback callback;
  final String text;

  const AppButton({
    Key? key,
    required this.callback,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
  }) : super(key: key);

  const AppButton.primary(
      {Key? key, required this.text, required this.callback})
      : textColor = Colors.white,
        backgroundColor = const Color(0xff663399),
        super(key: key);

  const AppButton.secondary(
      {Key? key, required this.text, required this.callback})
      : textColor = const Color(0xff663399),
        backgroundColor = Colors.white,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: backgroundColor,
        onPrimary: textColor,
        minimumSize: Size(120, 40)
      ),
        onPressed: callback,
        child: Text(text, style: TextStyle(
          color: textColor,
        ),),
    );
  }
}
