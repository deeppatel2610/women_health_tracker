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

  Future<void> qAnsAdd({
    required String ans,
    required String email,
    required String keyName,
  }) async {
    await fireStore.collection('users').doc(email).update({keyName: ans});
  }
}
