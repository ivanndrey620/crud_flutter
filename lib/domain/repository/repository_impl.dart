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
  void editUser(User user) {
    firebaseFirestore
        .collection(collectionPath)
        .doc(user.id)
        .set(user.toJson());
  }

  @override
  void removeUser(User user) {}

  @override
  void deleteUser(String id) {
    firebaseFirestore.collection(collectionPath).doc(id).delete();
  }

  @override
  CollectionReference<User> getUsers() {
    return firebaseFirestore.collection(collectionPath).withConverter(
          fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
          toFirestore: (taskModel, _) => taskModel.toJson(),
        );
  }
}
