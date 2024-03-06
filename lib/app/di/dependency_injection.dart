import 'package:crud_flutter/features/form/bloc/user_form_bloc.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void initDI() {
  locator.registerFactory<UserFormBloc>(() => UserFormBloc());
}
