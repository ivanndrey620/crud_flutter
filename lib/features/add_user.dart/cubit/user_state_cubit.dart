import 'package:bloc/bloc.dart';
import 'package:crud_flutter/features/add_user.dart/utils/user_state_enum.dart';

class UserStateCubit extends Cubit<UserStateEnum> {
  UserStateCubit() : super(UserStateEnum.non);

  void changeUserState(UserStateEnum userStateEnum) => emit(userStateEnum);
}
