import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:tomato_leaf/core/utils/log_print.dart';

class AuthController extends GetxController {
  final googleSignIn = GoogleSignIn();

  final _user = Rxn<GoogleSignInAccount?>();

  GoogleSignInAccount? get user => _user.value;

  Future<void> signInAnonymously() async {
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.signInAnonymously();
      LogPrint.info(
          "Signed in with temporary account: ${userCredential.user!.uid}");
    } catch (e) {
      LogPrint.error("Failed to sign in anonymously: $e");
    }
  }

  Future signInWithGoogle() async {
    try {
      // reset akun
      _user.value = null;

      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      _user.value = googleUser;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e, s) {
      LogPrint.error("Exception : $e | $s");
    }
  }
}
