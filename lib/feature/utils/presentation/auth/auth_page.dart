import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tomato_leaf/feature/utils/presentation/auth/auth_controller.dart';

class AuthPage extends StatelessWidget {
  static String routeName = '/auth';

  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {

    final AuthController controller = Get.find();

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async{
            controller.signInWithGoogle();
          },
          child: const Text("TEST LOGIN"),
        ),
      ),
    );
  }
}
