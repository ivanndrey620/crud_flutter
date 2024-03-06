import 'package:bloc/bloc.dart';
import 'package:crud_flutter/data/repository/repository.dart';
import 'package:crud_flutter/features/add_user.dart/domain/models/user.dart';
import 'package:crud_flutter/features/form/bloc/form_ui_state.dart';

part 'user_form_event.dart';
part 'user_form_state.dart';

class UserFormBloc extends Bloc<UserFormEvent, UserFormState> {
  final Repository repository;

  UserFormBloc({required this.repository}) : super(const UserFormState()) {
    on<OnAddUserNameEvent>(
      (event, emit) => emit(
        state.copyWith(
          uiState: const FormUiState.initial(),
          name: event.name,
        ),
      ),
    );

    on<OnAddUserLastNameEvent>(
      (event, emit) => emit(
        state.copyWith(
          uiState: const FormUiState.initial(),
          lastname: event.lastname,
        ),
      ),
    );

    on<OnAddUserPhoneEvent>(
      (event, emit) => emit(
        state.copyWith(
          uiState: const FormUiState.initial(),
          phone: int.parse(event.phone),
        ),
      ),
    );

    on<OnAddUserAddressEvent>(
      (event, emit) => emit(
        state.copyWith(
          uiState: const FormUiState.initial(),
          address: event.address,
        ),
      ),
    );

    on<OnAddUserEmailEvent>(
      (event, emit) => emit(
        state.copyWith(
          uiState: const FormUiState.initial(),
          email: event.email,
        ),
      ),
    );

    on<OnAddUserDateOfBirthEvent>(
      (event, emit) => emit(
        state.copyWith(
          uiState: const FormUiState.initial(),
          dateOfBirth: event.dateOfBirth,
        ),
      ),
    );

    on<OnAddUserPasswordEvent>(
      (event, emit) => emit(
        state.copyWith(
          uiState: const FormUiState.initial(),
          password: event.password,
        ),
      ),
    );

    on<OnAddUserEvent>((event, emit) {
      final name = state.name;
      final lastname = state.lastname;
      final phone = state.phone;
      final address = state.address;
      final email = state.email;
      final dateOfBirth = state.dateOfBirth;
      final password = state.password;

      emit(state.copyWith(uiState: const FormUiState.loading()));

      if (name.isEmpty ||
          lastname.isEmpty ||
          phone == 0 ||
          address.isEmpty ||
          email.isEmpty ||
          dateOfBirth.isEmpty ||
          password.isEmpty) {
        emit(state.copyWith(
          uiState: const FormUiState.error(
              message: 'Debe completar todos los campos'),
        ));

        return;
      }
      final user = User(
        name: name,
        lastname: lastname,
        phone: phone,
        address: address,
        email: email,
        dateOfBirth: dateOfBirth,
        password: password,
        isActive: false,
      );

      repository.addUser(user);

      emit(state.copyWith(uiState: const FormUiState.loaded()));
    });
  }
}
