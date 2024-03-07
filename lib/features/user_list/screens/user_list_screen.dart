import 'package:crud_flutter/features/features.dart';
import 'package:crud_flutter/features/user_list/bloc/user_list_bloc.dart';
import 'package:crud_flutter/features/user_list/widgets/slidable_user_item.dart';
import 'package:crud_flutter/utils/contants.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          locator.get<UserListBloc>()..add(OnGetUserListEvent()),
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          toolbarHeight: 150,
          backgroundColor: Theme.of(context).primaryColor,
          title: const Padding(
            padding: EdgeInsets.all(32.0),
            child: Text(
              Constants.userList,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 32,
              ),
            ),
          ),
        ),
        body: BlocBuilder<UserListBloc, UserListState>(
          builder: (context, state) {
            return state.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (reference) => FirestoreListView<User>(
                query: reference,
                padding: const EdgeInsets.all(8.0),
                itemBuilder: (context, snapshot) {
                  final user = snapshot.data();

                  final userWithId = user.copyWith(id: snapshot.id);

                  return SlidableUserItem(user: userWithId);
                },
                emptyBuilder: (context) => const Center(
                  child: Text(Constants.noUsersFound),
                ),
              ),
              error: (error) => Center(
                child: Text(error),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(
            side: BorderSide(
              color: Colors.white,
              width: 2,
            ),
          ),
          onPressed: () => showModalBottomSheet(
            isScrollControlled: true,
            elevation: 5,
            context: context,
            builder: (_) => const AddUserScreen(),
          ),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
