import 'package:example_contact_app/data/api/api_util.dart';
import 'package:example_contact_app/domain/models/contact.dart';
import 'package:example_contact_app/internal/app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.from(
        colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: const Color(0xff663399),
            onPrimary: const Color(0xff663399),
            secondary: const Color(0xfff6efe9),
            onSecondary: const Color(0xfff6efe9),
            error: const Color(0xffff4c30),
            onError: const Color(0xffff4c30),
            background: const Color(0xffffffff),
            onBackground: const Color(0xffffffff),
            surface: const Color(0xfff6efe9),
            onSurface: const Color(0xfff6efe9),
        ),
      textTheme: TextTheme(
        bodyText1: TextStyle(
          color: Color(0xff999999),
        )
      ),
      useMaterial3: true
    ),
    debugShowCheckedModeBanner: false,
    home: App(),
  ));
}