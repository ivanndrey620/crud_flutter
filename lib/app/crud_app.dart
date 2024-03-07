import 'package:crud_flutter/app/navigation/app_router.dart';
import 'package:flutter/material.dart';

class CrudApp extends StatelessWidget {
  CrudApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
    );
  }
}
