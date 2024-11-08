import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:tomato_leaf/core/utils/log_print.dart';
import 'package:tomato_leaf/feature/utils/presentation/dashboard/dashboard_page.dart';

class AuthController extends GetxController {
  final googleSignIn = GoogleSignIn();

  final _user = Rxn<GoogleSignInAccount?>();

  GoogleSignInAccount? get user => _user.value;

  Future<void> _googleAuthLogin() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      await _googleAuthLogout();
    } catch (ex, s) {
      Fluttertoast.showToast(msg: "Exception : $ex");
      LogPrint.exception(ex, s, this, '_googleAuth');
    }
  }

  Future _googleAuthLogout() async {
    await googleSignIn.disconnect();
    await googleSignIn.signOut();
  }

  Future authenticate() async {
    try {
      await _googleAuthLogin();
      LogPrint.debug("after google auth");
      final User? currentUser = FirebaseAuth.instance.currentUser;
      if(currentUser != null){
        LogPrint.debug("email : ${currentUser.email}");
        LogPrint.debug("display name : ${currentUser.displayName}");
        Get.toNamed(DashboardPage.routeName.toString());
      }else{
        LogPrint.debug("current user is null");
      }
    } catch (ex, s) {
      Fluttertoast.showToast(msg: "Exception : $ex");
      LogPrint.exception(ex, s, this, 'googleSign');
    }
  }
}
