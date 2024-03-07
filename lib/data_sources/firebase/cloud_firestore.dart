import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFirestore {
  CloudFirestore();

  static FirebaseFirestore instance() => FirebaseFirestore.instance;
}
