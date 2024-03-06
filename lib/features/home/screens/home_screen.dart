import 'package:crud_flutter/features/features.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Content'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(
          side: BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
        onPressed: () {},
        child: IconButton(
          onPressed: () => showModalBottomSheet(
            isScrollControlled: true,
            elevation: 5,
            context: context,
            builder: (_) => const AddUserScreen(),
          ),
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }
}
