part of 'user_list_bloc.dart';

@freezed
class UserListState with _$UserListState {
  const factory UserListState.loading() = _Loading;

  const factory UserListState.loaded(
      {required CollectionReference<User> user}) = _Loaded;

  const factory UserListState.error({required String message}) = _Error;
}
