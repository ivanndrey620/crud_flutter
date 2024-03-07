import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_flutter/data/repository/repository.dart';
import 'package:crud_flutter/features/add_user.dart/domain/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_list_event.dart';
part 'user_list_state.dart';
part 'user_list_bloc.freezed.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  final Repository repository;

  UserListBloc({required this.repository})
      : super(const UserListState.loading()) {
    on<OnChangeUserStateEvent>((event, emit) {
      final user = event.user;

      final changeUserState = user.copyWith(isActive: !user.isActive);

      repository.editUser(changeUserState);
    });

    on<OnGetUserListEvent>((event, emit) {
      try {
        emit(const UserListState.loading());

        final result = repository.getUsers();

        emit(UserListState.loaded(user: result));
      } catch (e) {
        emit(UserListState.error(message: e.toString()));
      }
    });
  }

  void onDeleteUser(String id) {
    repository.deleteUser(id);
  }
}
