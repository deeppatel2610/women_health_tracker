import 'package:firebase_auth/firebase_auth.dart';

class FireAuth {
  FireAuth._();

  static FireAuth fireAuth = FireAuth._();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> createUser({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      return "error";
    }
    return "";
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      return "error";
    }
    return "";
  }

  User? currentUser() {
    User? user = _firebaseAuth.currentUser;
    return user;
  }
}
