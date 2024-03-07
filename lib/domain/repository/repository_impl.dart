import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_flutter/data/repository/repository.dart';
import 'package:crud_flutter/features/add_user.dart/domain/models/user.dart';

class RepositoryImpl extends Repository {
  static const String collectionPath = 'crud_app';

  final FirebaseFirestore db;

  RepositoryImpl({required this.db});

  @override
  void addUser(User user) {
    db.collection(collectionPath).add(user.toJson());
  }

  @override
  void editUser(User user) {
    db.collection(collectionPath).doc(user.id).set(user.toJson());
  }

  @override
  void removeUser(User user) {}

  @override
  void deleteUser(String id) {
    db.collection(collectionPath).doc(id).delete();
  }

  @override
  CollectionReference<User> getUsers() {
    return db.collection(collectionPath).withConverter(
          fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
          toFirestore: (taskModel, _) => taskModel.toJson(),
        );
  }

  @override
  DocumentReference<User> getUserById(String id) {
    return db.collection(collectionPath).doc(id).withConverter(
          fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
          toFirestore: (taskModel, _) => taskModel.toJson(),
        );
  }

  @override
  Future<User> getUserByIdNew(String id) async {
    try {
      final doc = await db.collection(collectionPath).doc(id).get();

      final data = doc.data();

      final user = User.fromJson(data!);

      return user;
    } catch (e) {
      throw ('Error is $e');
    }
  }
}
