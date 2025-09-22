import 'package:flutter/material.dart';
import 'package:learn_app/pages/state_manage_example_page.dart';

void main(List<String> args) {
  runApp(const ButtonTypeApp());
}

class ButtonTypeApp extends StatelessWidget {
  const ButtonTypeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const StateManageExamplePage());
  }
}
