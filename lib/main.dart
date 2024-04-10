import 'package:flutter/material.dart';
import 'package:login_cadastro/ui/pages/login.dart';
import 'package:login_cadastro/ui/pages/profile.dart';

void main() => runApp(MyApp());

class MyApp extends MaterialApp {
  MyApp({super.key})
      : super(
          home: Profile(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(brightness: Brightness.dark),
        );
}
