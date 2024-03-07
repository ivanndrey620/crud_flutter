import 'package:auto_route/auto_route.dart';
import 'package:crud_flutter/features/user_list/screens/user_list_screen.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const UserListScreen();
  }
}
