import 'package:flutter/material.dart';
import 'package:learn_app/router/app_router.dart';

void main(List<String> args) {
  runApp(LearnApp());
}

class LearnApp extends StatelessWidget {
  final _appRouter = AppRouter();
  LearnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: _appRouter.config());
  }
}
