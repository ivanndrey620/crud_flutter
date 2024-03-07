import 'package:auto_route/auto_route.dart';
import 'package:crud_flutter/app/navigation/app_router.dart';
import 'package:crud_flutter/features/add_user.dart/domain/models/user.dart';
import 'package:crud_flutter/features/user_list/bloc/user_list_bloc.dart';
import 'package:crud_flutter/features/user_list/widgets/custom_rounded_color_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserItem extends StatelessWidget {
  const UserItem({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.push(DetailRoute(id: user.id)),
      child: Card(
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
      ),
    );
  }
}
