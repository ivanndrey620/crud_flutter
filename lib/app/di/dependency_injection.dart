import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_flutter/data/repository/repository.dart';
import 'package:crud_flutter/data_sources/firebase/cloud_firestore.dart';
import 'package:crud_flutter/domain/repository/repository_impl.dart';
import 'package:crud_flutter/features/form/bloc/user_form_bloc.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void initDI() {
  locator.registerFactory<FirebaseFirestore>(() => CloudFirestore.instance());

  locator.registerSingleton<Repository>(
      RepositoryImpl(firebaseFirestore: locator.get()));

  locator.registerFactory<UserFormBloc>(
      () => UserFormBloc(repository: locator.get()));
}
