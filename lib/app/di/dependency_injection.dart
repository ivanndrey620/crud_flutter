import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_flutter/data/repository/repository.dart';
import 'package:crud_flutter/data_sources/firebase/cloud_firestore.dart';
import 'package:crud_flutter/domain/repository/repository_impl.dart';
import 'package:crud_flutter/features/add_user.dart/cubit/user_state_cubit.dart';
import 'package:crud_flutter/features/detail/bloc/detail_bloc.dart';
import 'package:crud_flutter/features/form/bloc/user_form_bloc.dart';
import 'package:crud_flutter/features/user_list/bloc/user_list_bloc.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void initDI() {
  locator.registerFactory<FirebaseFirestore>(() => CloudFirestore.instance());

  locator.registerSingleton<Repository>(RepositoryImpl(db: locator.get()));

  locator.registerFactory<UserFormBloc>(
      () => UserFormBloc(repository: locator.get()));

  locator.registerFactory(() => UserStateCubit());

  locator.registerFactory(() => UserListBloc(repository: locator.get()));

  locator.registerFactory(() => DetailBloc(repository: locator.get()));
}
