part of 'detail_bloc.dart';

@freezed
class DetailState with _$DetailState {
  const factory DetailState.loading() = _Loading;

  const factory DetailState.loaded({required User user}) = _Loaded;

  const factory DetailState.error({required String message}) = _Error;
}
