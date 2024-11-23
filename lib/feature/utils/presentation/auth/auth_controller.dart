import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:tomato_leaf/core/utils/fcm_token_service.dart';
import 'package:tomato_leaf/core/utils/log_print.dart';
import 'package:tomato_leaf/data/models/user/user_model.dart';
import 'package:tomato_leaf/domain/usecases/user/add_or_update_user_usecase.dart';
import 'package:tomato_leaf/domain/usecases/user/auth_usecase.dart';
import 'package:tomato_leaf/feature/utils/presentation/dashboard/dashboard_page.dart';

class AuthController extends GetxController {

  final AuthUseCase authUseCase;
  final AddOrUpdateUserUseCase addOrUpdateUserUseCase;

  final googleSignIn = GoogleSignIn();

  final _user = Rxn<GoogleSignInAccount?>();

  AuthController({
    required this.authUseCase,
    required this.addOrUpdateUserUseCase,
  });

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

        FcmTokenService fcmTokenService = await FcmTokenService().init();

        final response = await authUseCase.call(
          email: currentUser.email ?? '',
          uid: currentUser.uid,
          fullName: currentUser.displayName ?? '',
          fcmToken: fcmTokenService.fcmToken ?? '',
        );

        Map<String, dynamic> payload = response?.data;

        if(response?.statusCode == HttpStatus.ok){
          var userEntity = UserModel.fromJson(response?.data['data']).toEntity();
          await addOrUpdateUserUseCase(user: userEntity);
          Get.offAllNamed(DashboardPage.routeName.toString());
        }else{
          Fluttertoast.showToast(msg: "Failure : ${payload['message']}");
          LogPrint.error("Failure : ${payload['message']}");
        }
      }else{
        LogPrint.debug("current user is null");
      }
    } catch (ex, s) {
      Fluttertoast.showToast(msg: "Exception : $ex");
      LogPrint.exception(ex, s, this, 'googleSign');
    }
  }
}
