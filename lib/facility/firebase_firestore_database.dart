import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:women_health_tracker/model/user_model.dart';

class FirebaseFireStoreDatabase {
  FirebaseFireStoreDatabase._();

  static final FirebaseFireStoreDatabase fireStoreDatabase =
      FirebaseFireStoreDatabase._();

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  Future<void> addUser(UserModel user) async {
    await fireStore
        .collection('users')
        .doc(user.email)
        .set(UserModel.toMap(user));
  }

  Future<void> updateData({
    required String data,
    required String email,
    required String keyName,
  }) async {
    await fireStore.collection('users').doc(email).update({keyName: data});
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> readUserFireStore({
    required String email,
  }) async {
    return await fireStore.collection('users').doc(email).get();
  }

  Future<void> addEvent({
    required String date,
    required String email,
    required String event,
  }) async {
    await fireStore
        .collection('users')
        .doc(email)
        .collection("events")
        .doc(email)
        .set({date: event});
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> readEvent({
    required String email,
  }) async {
    return await fireStore
        .collection('users')
        .doc(email)
        .collection("events")
        .doc(email)
        .get();
  }
}
