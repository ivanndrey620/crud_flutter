import 'package:bloc/bloc.dart';
import 'package:crud_flutter/features/add_user.dart/utils/user_state_enum.dart';
import 'package:crud_flutter/features/features.dart';

class UserStateCubit extends Cubit<UserStateEnum> {
  UserStateCubit() : super(UserStateEnum.non);

  void changeUserState(UserStateEnum userStateEnum) => emit(userStateEnum);

  void init(User? user) {
    if (user == null) {
      emit(UserStateEnum.non);
      return;
    }

    emit(user.isActive ? UserStateEnum.active : UserStateEnum.inactive);
  }
}
