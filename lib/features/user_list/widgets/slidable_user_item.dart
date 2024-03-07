import 'package:crud_flutter/features/features.dart';
import 'package:crud_flutter/features/user_list/bloc/user_list_bloc.dart';
import 'package:crud_flutter/features/user_list/widgets/user_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableUserItem extends StatelessWidget {
  const SlidableUserItem({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.25,
        children: [
          SlidableAction(
            onPressed: (context) =>
                context.read<UserListBloc>().onDeleteUser(user.id),
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
            borderRadius: BorderRadius.circular(10),
            spacing: 0,
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.25,
        children: [
          SlidableAction(
            onPressed: (context) => showModalBottomSheet(
              isScrollControlled: true,
              elevation: 5,
              context: context,
              builder: (_) => AddUserScreen(user: user),
            ),
            backgroundColor: const Color(0xFF7BC043),
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
            borderRadius: BorderRadius.circular(10),
            spacing: 0,
          ),
        ],
      ),
      child: UserItem(user: user),
    );
  }
}
