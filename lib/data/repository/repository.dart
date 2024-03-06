import 'package:crud_flutter/features/features.dart';

abstract class Repository {
  void addUser(User user);

  void editUser(User user);

  void removeUser(User user);
}
