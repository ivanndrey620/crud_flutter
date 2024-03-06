import 'package:crud_flutter/features/features.dart';
import 'package:crud_flutter/features/form/bloc/user_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddUserScreen extends StatelessWidget {
  const AddUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator.get<UserFormBloc>(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocListener<UserFormBloc, UserFormState>(
          listener: (context, state) {
            state.uiState.whenOrNull(
              error: (message) => Fluttertoast.showToast(msg: message),
              loaded: () {
                Navigator.pop(context);
              },
            );
          },
          child: BlocBuilder<UserFormBloc, UserFormState>(
            builder: (context, state) {
              return const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 16),
                  CustomTitleWidget(title: 'Agregar nuevo Usuario'),
                  SizedBox(height: 32),
                  _NameField(),
                  SizedBox(height: 16),
                  _LastnameField(),
                  SizedBox(height: 16),
                  _PhoneField(),
                  SizedBox(height: 16),
                  _AddressField(),
                  SizedBox(height: 16),
                  _EmailField(),
                  SizedBox(height: 16),
                  _DateOfBirthField(),
                  SizedBox(height: 16),
                  _PasswordField(),
                  SizedBox(height: 16),
                  _AddButton(),
                  SizedBox(height: 16),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  const _AddButton();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => context.read<UserFormBloc>().add(OnAddUserEvent()),
        child: const Text('Guardar'),
      ),
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField();

  @override
  Widget build(BuildContext context) {
    return TitleFieldWidget(
      title: 'Contraseña:',
      keyboardType: TextInputType.visiblePassword,
      onChangedCallback: (password) => context
          .read<UserFormBloc>()
          .add(OnAddUserPasswordEvent(password: password)),
      onSubmittedCallback: (password) => context
          .read<UserFormBloc>()
          .add(OnAddUserPasswordEvent(password: password)),
    );
  }
}

class _DateOfBirthField extends StatelessWidget {
  const _DateOfBirthField();

  @override
  Widget build(BuildContext context) {
    return TitleFieldWidget(
      title: 'Fecha de Nacimiento:',
      hintText: '[dd/mm/yy]',
      onChangedCallback: (dateOfBirth) => context
          .read<UserFormBloc>()
          .add(OnAddUserDateOfBirthEvent(dateOfBirth: dateOfBirth)),
      onSubmittedCallback: (dateOfBirth) => context
          .read<UserFormBloc>()
          .add(OnAddUserDateOfBirthEvent(dateOfBirth: dateOfBirth)),
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField();

  @override
  Widget build(BuildContext context) {
    return TitleFieldWidget(
      title: 'Correo:',
      keyboardType: TextInputType.emailAddress,
      onChangedCallback: (email) =>
          context.read<UserFormBloc>().add(OnAddUserEmailEvent(email: email)),
      onSubmittedCallback: (email) =>
          context.read<UserFormBloc>().add(OnAddUserEmailEvent(email: email)),
    );
  }
}

class _AddressField extends StatelessWidget {
  const _AddressField();

  @override
  Widget build(BuildContext context) {
    return TitleFieldWidget(
      title: 'Dirección:',
      keyboardType: TextInputType.streetAddress,
      onChangedCallback: (address) => context
          .read<UserFormBloc>()
          .add(OnAddUserAddressEvent(address: address)),
      onSubmittedCallback: (address) => context
          .read<UserFormBloc>()
          .add(OnAddUserAddressEvent(address: address)),
    );
  }
}

class _PhoneField extends StatelessWidget {
  const _PhoneField();

  @override
  Widget build(BuildContext context) {
    return TitleFieldWidget(
      title: 'Teléfono:',
      keyboardType: TextInputType.phone,
      onChangedCallback: (phone) =>
          context.read<UserFormBloc>().add(OnAddUserPhoneEvent(phone: phone)),
      onSubmittedCallback: (phone) =>
          context.read<UserFormBloc>().add(OnAddUserPhoneEvent(phone: phone)),
    );
  }
}

class _LastnameField extends StatelessWidget {
  const _LastnameField();

  @override
  Widget build(BuildContext context) {
    return TitleFieldWidget(
      title: 'Apellido:',
      onChangedCallback: (lastname) => context
          .read<UserFormBloc>()
          .add(OnAddUserLastNameEvent(lastname: lastname)),
      onSubmittedCallback: (lastname) => context
          .read<UserFormBloc>()
          .add(OnAddUserLastNameEvent(lastname: lastname)),
    );
  }
}

class _NameField extends StatelessWidget {
  const _NameField();

  @override
  Widget build(BuildContext context) {
    return TitleFieldWidget(
        title: 'Nombre:',
        onChangedCallback: (name) =>
            context.read<UserFormBloc>().add(OnAddUserNameEvent(name: name)),
        onSubmittedCallback: (name) =>
            context.read<UserFormBloc>().add(OnAddUserNameEvent(name: name)));
  }
}
