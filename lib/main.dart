import 'package:flutter/material.dart';
import 'package:translate/translate/languge_translate.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
//y
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: LangugeTranslate());
  }
}
