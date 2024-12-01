// ignore_for_file: use_build_context_synchronously

import 'package:fingerprint/consts/colors.dart';
import 'package:fingerprint/screens/home.dart';
import 'package:fingerprint/widgets/text.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class LoginClass {
  static final FirebaseDatabase database = FirebaseDatabase.instance;
  static void login(
    TextEditingController loginController,
    TextEditingController passwordController,
    BuildContext context,
  ) async {
    final String login = loginController.text;
    final String password = passwordController.text;

    if (login.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: ColorsClass.blue,
          content: TextWidget(
            size: 20.0,
            color: ColorsClass.white,
            data: "Login va parolni kiriting",
          ),
        ),
      );
      return;
    }

    DatabaseReference ref = database.ref('Users');

    try {
      DataSnapshot loginSnapshot = await ref.child('login-1').get();
      DataSnapshot passwordSnapshot = await ref.child('password-1').get();

      if (loginSnapshot.exists && passwordSnapshot.exists) {
        String storedLogin = loginSnapshot.value.toString();
        String storedPassword = passwordSnapshot.value.toString();

        if (storedLogin == login && storedPassword == password) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: ColorsClass.red,
              content: TextWidget(
                size: 20.0,
                color: ColorsClass.white,
                data: "Login yoki parol noto'g'ri",
              ),
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: ColorsClass.red,
            content: TextWidget(
              size: 20.0,
              color: ColorsClass.white,
              data: "Foydalanuvchi topilmadi",
            ),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: ColorsClass.red,
          content: TextWidget(
            size: 20.0,
            color: ColorsClass.white,
            data: "Xatolik yuz berdi",
          ),
        ),
      );
    }
  }
}
