part of 'user_form_bloc.dart';

class UserFormState {
  final String? name;
  final String? lastname;
  final int? phone;
  final String? address;
  final String? email;
  final String? dateOfBirth;
  final String? password;
  final FormUiState uiState;

  const UserFormState({
    this.name,
    this.lastname,
    this.phone,
    this.address,
    this.email,
    this.dateOfBirth,
    this.password,
    FormUiState? uiState,
  }) : uiState = uiState ?? const FormUiState.initial();

  UserFormState copyWith({
    String? name,
    String? lastname,
    int? phone,
    String? address,
    String? email,
    String? dateOfBirth,
    String? password,
    FormUiState? uiState,
  }) =>
      UserFormState(
        name: name ?? this.name,
        lastname: lastname ?? this.lastname,
        phone: phone ?? this.phone,
        address: address ?? this.address,
        email: email ?? this.email,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        password: password ?? this.password,
        uiState: uiState ?? this.uiState,
      );
}
