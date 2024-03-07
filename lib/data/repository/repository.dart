import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_flutter/features/features.dart';

abstract class Repository {
  void addUser(User user);

  void editUser(User user);

  void removeUser(User user);

  void deleteUser(String id);

  CollectionReference<User> getUsers();
}
