import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuth {
  GoogleAuth._();
  static final GoogleAuth googleAuth = GoogleAuth._();

  final GoogleSignIn? googleSignIn = GoogleSignIn();
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<Future<UserCredential>> signInWithGoogle() async {
    final GoogleSignInAccount? account = await _googleSignIn.signIn();
    final GoogleSignInAuthentication? authentication =
    await account?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: authentication?.accessToken,
      idToken: authentication?.idToken,
    );

    return FirebaseAuth.instance.signInWithCredential(credential);
  }

  void googleSignOut()
  {
    _googleSignIn.signOut();
  }
}