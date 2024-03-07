import 'package:bloc/bloc.dart';
import 'package:crud_flutter/data/repository/repository.dart';
import 'package:crud_flutter/features/add_user.dart/domain/models/user.dart';
import 'package:crud_flutter/features/features.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_event.dart';
part 'detail_state.dart';
part 'detail_bloc.freezed.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final Repository repository;

  DetailBloc({required this.repository}) : super(const DetailState.loading()) {
    on<OnGetUserDetailEvent>((event, emit) async {
      try {
        emit(const DetailState.loading());

        final user = await repository.getUserByIdNew(event.id);

        emit(DetailState.loaded(user: user));
      } catch (e) {
        emit(DetailState.error(message: e.toString()));
      }
    });
  }
}
