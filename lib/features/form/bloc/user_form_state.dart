part of 'user_form_bloc.dart';

class UserFormState {
  final String? id;
  final String? name;
  final String? lastname;
  final int? phone;
  final String? address;
  final String? email;
  final String? dateOfBirth;
  final String? password;
  final UserStateEnum isActive;
  final FormUiState uiState;

  const UserFormState({
    this.id,
    this.name,
    this.lastname,
    this.phone,
    this.address,
    this.email,
    this.dateOfBirth,
    this.password,
    UserStateEnum? isActive,
    FormUiState? uiState,
  })  : isActive = isActive ?? UserStateEnum.non,
        uiState = uiState ?? const FormUiState.initial();

  UserFormState copyWith({
    String? id,
    String? name,
    String? lastname,
    int? phone,
    String? address,
    String? email,
    String? dateOfBirth,
    String? password,
    UserStateEnum? isActive,
    FormUiState? uiState,
  }) =>
      UserFormState(
        id: id ?? this.id,
        isActive: isActive ?? this.isActive,
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
