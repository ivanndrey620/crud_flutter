part of 'user_list_bloc.dart';

class UserListEvent {}

final class OnGetUserListEvent extends UserListEvent {}

final class OnChangeUserStateEvent extends UserListEvent {
  final User user;

  OnChangeUserStateEvent({required this.user});
}
