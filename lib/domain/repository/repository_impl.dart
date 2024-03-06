import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_flutter/data/repository/repository.dart';
import 'package:crud_flutter/features/add_user.dart/domain/models/user.dart';

class RepositoryImpl extends Repository {
  static const String collectionPath = 'crud_app';

  final FirebaseFirestore firebaseFirestore;

  RepositoryImpl({required this.firebaseFirestore});

  @override
  void addUser(User user) {
    firebaseFirestore.collection(collectionPath).add(user.toJson());
  }

  @override
  void editUser(User user) {}

  @override
  void removeUser(User user) {}
}
