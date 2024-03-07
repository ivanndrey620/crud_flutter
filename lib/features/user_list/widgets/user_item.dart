import 'package:crud_flutter/features/features.dart';
import 'package:crud_flutter/features/user_list/bloc/user_list_bloc.dart';
import 'package:crud_flutter/features/user_list/widgets/custom_rounded_color_widget.dart';
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
      child: UserTask(user: user),
    );
  }
}

class UserTask extends StatelessWidget {
  const UserTask({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              width: 5,
              height: 100,
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${user.name} - ${user.lastname}',
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    user.email,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    user.address,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    user.dateOfBirth,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
            CustomRoundedColorWidget(
              child: GestureDetector(
                onTap: () => context
                    .read<UserListBloc>()
                    .add(OnChangeUserStateEvent(user: user)),
                child: Icon(
                  user.isActive ? Icons.check : Icons.close,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 5),
          ],
        ),
      ),
    );
  }
}
