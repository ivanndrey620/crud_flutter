import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_ui_state.freezed.dart';

@freezed
class FormUiState with _$FormUiState {
  const factory FormUiState.initial() = _Initial;

  const factory FormUiState.loading() = _Loading;

  const factory FormUiState.loaded() = _Loaded;

  const factory FormUiState.error({required String message}) = _Error;
}
