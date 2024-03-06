part of 'user_form_bloc.dart';

sealed class UserFormEvent {}

final class OnAddUserNameEvent extends UserFormEvent {
  final String name;

  OnAddUserNameEvent({required this.name});
}

final class OnAddUserLastNameEvent extends UserFormEvent {
  final String lastname;

  OnAddUserLastNameEvent({required this.lastname});
}

final class OnAddUserPhoneEvent extends UserFormEvent {
  final String phone;

  OnAddUserPhoneEvent({required this.phone});
}

final class OnAddUserAddressEvent extends UserFormEvent {
  final String address;

  OnAddUserAddressEvent({required this.address});
}

final class OnAddUserEmailEvent extends UserFormEvent {
  final String email;

  OnAddUserEmailEvent({required this.email});
}

final class OnAddUserDateOfBirthEvent extends UserFormEvent {
  final String dateOfBirth;

  OnAddUserDateOfBirthEvent({required this.dateOfBirth});
}

final class OnAddUserPasswordEvent extends UserFormEvent {
  final String password;

  OnAddUserPasswordEvent({required this.password});
}

final class OnAddUserEvent extends UserFormEvent {
  final UserStateEnum userStateEnum;

  OnAddUserEvent({required this.userStateEnum});
}
