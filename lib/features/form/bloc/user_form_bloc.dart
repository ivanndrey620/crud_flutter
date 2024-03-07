import 'package:bloc/bloc.dart';
import 'package:crud_flutter/data/repository/repository.dart';
import 'package:crud_flutter/features/add_user.dart/domain/models/user.dart';
import 'package:crud_flutter/features/add_user.dart/utils/user_state_enum.dart';
import 'package:crud_flutter/features/form/bloc/form_ui_state.dart';

part 'user_form_event.dart';
part 'user_form_state.dart';

class UserFormBloc extends Bloc<UserFormEvent, UserFormState> {
  final Repository repository;

  late User? user;

  UserFormBloc({required this.repository}) : super(const UserFormState()) {
    on<OnInitUserEvent>((event, emit) {
      final user = event.user;

      if (user == null) return;

      final isActive =
          user.isActive ? UserStateEnum.active : UserStateEnum.inactive;

      emit(state.copyWith(
        id: user.id,
        name: user.name,
        lastname: user.lastname,
        phone: user.phone,
        address: user.address,
        email: user.email,
        dateOfBirth: user.dateOfBirth,
        password: user.password,
        isActive: isActive,
      ));
    });

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

    on<OnEditUserEvent>((event, emit) {
      final id = state.id;
      final name = state.name;
      final lastname = state.lastname;
      final phone = state.phone;
      final address = state.address;
      final email = state.email;
      final dateOfBirth = state.dateOfBirth;
      final password = state.password;
      final isActive = state.isActive == UserStateEnum.active ? true : false;

      emit(state.copyWith(uiState: const FormUiState.loading()));

      final user = User(
        id: id!,
        name: name!,
        lastname: lastname!,
        phone: phone!,
        address: address!,
        email: email!,
        dateOfBirth: dateOfBirth!,
        password: password!,
        isActive: isActive,
      );

      repository.editUser(user);

      emit(state.copyWith(
          uiState: const FormUiState.loaded(message: 'Editado')));
    });

    on<OnAddUserEvent>((event, emit) {
      final name = state.name;
      final lastname = state.lastname;
      final phone = state.phone;
      final address = state.address;
      final email = state.email;
      final dateOfBirth = state.dateOfBirth;
      final password = state.password;

      final isActive =
          event.userStateEnum == UserStateEnum.active ? true : false;

      emit(state.copyWith(uiState: const FormUiState.loading()));

      if (name == null ||
          lastname == null ||
          phone == null ||
          address == null ||
          email == null ||
          dateOfBirth == null ||
          password == null) {
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
        isActive: isActive,
      );

      repository.addUser(user);

      emit(state.copyWith(
          uiState: const FormUiState.loaded(message: 'Agregado')));
    });
  }
}
