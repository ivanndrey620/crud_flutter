import 'package:crud_flutter/features/add_user.dart/cubit/user_state_cubit.dart';
import 'package:crud_flutter/features/add_user.dart/utils/user_state_enum.dart';
import 'package:crud_flutter/features/features.dart';
import 'package:crud_flutter/features/form/bloc/user_form_bloc.dart';
import 'package:crud_flutter/features/form/widgets/custom_field_title_widget.dart';
import 'package:crud_flutter/utils/contants.dart';
import 'package:crud_flutter/utils/date_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddUserScreen extends StatelessWidget {
  const AddUserScreen({super.key, this.user});

  final User? user;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              locator.get<UserFormBloc>()..add(OnInitUserEvent(user: user)),
        ),
        BlocProvider(
          create: (context) => locator.get<UserStateCubit>()..init(user),
        ),
      ],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocListener<UserFormBloc, UserFormState>(
          listener: (context, state) {
            state.uiState.whenOrNull(
              error: (message) => Fluttertoast.showToast(msg: message),
              loaded: (message) {
                Navigator.pop(context);
                Fluttertoast.showToast(msg: message);
              },
            );
          },
          child: BlocBuilder<UserFormBloc, UserFormState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 16),
                  const CustomTitleWidget(title: Constants.addUser),
                  const SizedBox(height: 32),
                  _NameField(initialValue: state.name),
                  const SizedBox(height: 16),
                  _LastnameField(initialValue: state.lastname),
                  const SizedBox(height: 16),
                  _PhoneField(initialValue: state.phone?.toString()),
                  const SizedBox(height: 16),
                  _AddressField(initialValue: state.address),
                  const SizedBox(height: 16),
                  _EmailField(initialValue: state.email),
                  const SizedBox(height: 16),
                  _DateOfBirthField(initialValue: state.dateOfBirth),
                  const SizedBox(height: 16),
                  _PasswordField(initialValue: state.password),
                  const SizedBox(height: 16),
                  const _ActiveOrInactive(),
                  const SizedBox(height: 16),
                  _AddOrEditButton(isEdit: user != null),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _ActiveOrInactive extends StatelessWidget {
  const _ActiveOrInactive();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserStateCubit, UserStateEnum>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IntrinsicWidth(
              child: RadioListTile(
                visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity,
                ),
                dense: true,
                contentPadding: EdgeInsets.zero,
                value: UserStateEnum.active,
                groupValue: state,
                onChanged: (value) =>
                    context.read<UserStateCubit>().changeUserState(value!),
                title: const Text(Constants.active),
              ),
            ),
            IntrinsicWidth(
              child: RadioListTile(
                visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity,
                ),
                dense: true,
                contentPadding: EdgeInsets.zero,
                value: UserStateEnum.inactive,
                groupValue: state,
                onChanged: (value) =>
                    context.read<UserStateCubit>().changeUserState(value!),
                title: const Text(Constants.inactive),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _AddOrEditButton extends StatelessWidget {
  const _AddOrEditButton({required this.isEdit});

  final bool isEdit;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          if (isEdit) {
            context.read<UserFormBloc>().add(OnEditUserEvent());
            return;
          }

          final userState = context.read<UserStateCubit>().state;

          context
              .read<UserFormBloc>()
              .add(OnAddUserEvent(userStateEnum: userState));
        },
        child: isEdit ? const Text(Constants.edit) : const Text(Constants.save),
      ),
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField({this.initialValue});

  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return TitleFieldWidget(
      initialValue: initialValue,
      title: Constants.password,
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
  const _DateOfBirthField({this.initialValue});

  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final selectedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1800, 1, 1),
          lastDate: DateTime.now(),
        );

        if (selectedDate == null) return;

        final dateOfBirth = selectedDate.prettyDate();

        if (context.mounted) {
          context
              .read<UserFormBloc>()
              .add(OnAddUserDateOfBirthEvent(dateOfBirth: dateOfBirth));
        }
      },
      child: Row(
        children: [
          const Expanded(
            child: CustomFieldTitleWidget(title: Constants.dateOfBirth),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: Text(initialValue ?? Constants.dateOfBirthHint),
            ),
          )
        ],
      ),
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField({this.initialValue});

  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return TitleFieldWidget(
      initialValue: initialValue,
      title: Constants.email,
      keyboardType: TextInputType.emailAddress,
      onChangedCallback: (email) =>
          context.read<UserFormBloc>().add(OnAddUserEmailEvent(email: email)),
      onSubmittedCallback: (email) =>
          context.read<UserFormBloc>().add(OnAddUserEmailEvent(email: email)),
    );
  }
}

class _AddressField extends StatelessWidget {
  const _AddressField({this.initialValue});

  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return TitleFieldWidget(
      initialValue: initialValue,
      title: Constants.address,
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
  const _PhoneField({this.initialValue});

  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return TitleFieldWidget(
      maxLength: 8,
      initialValue: initialValue,
      title: Constants.phone,
      keyboardType: TextInputType.phone,
      onChangedCallback: (phone) =>
          context.read<UserFormBloc>().add(OnAddUserPhoneEvent(phone: phone)),
      onSubmittedCallback: (phone) =>
          context.read<UserFormBloc>().add(OnAddUserPhoneEvent(phone: phone)),
    );
  }
}

class _LastnameField extends StatelessWidget {
  const _LastnameField({this.initialValue});

  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return TitleFieldWidget(
      initialValue: initialValue,
      title: Constants.lastname,
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
  const _NameField({this.initialValue});

  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return TitleFieldWidget(
        initialValue: initialValue,
        title: Constants.name,
        onChangedCallback: (name) =>
            context.read<UserFormBloc>().add(OnAddUserNameEvent(name: name)),
        onSubmittedCallback: (name) =>
            context.read<UserFormBloc>().add(OnAddUserNameEvent(name: name)));
  }
}
