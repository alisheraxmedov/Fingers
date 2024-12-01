// ignore_for_file: use_build_context_synchronously

import 'package:fingerprint/consts/colors.dart';
import 'package:fingerprint/functions/check_login.dart';
import 'package:fingerprint/widgets/button.dart';
import 'package:fingerprint/widgets/text.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: ColorsClass.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Container(
              height: width * 1.2,
              width: width,
              decoration: BoxDecoration(
                color: ColorsClass.cardBackgroundColor,
                borderRadius: BorderRadius.circular(
                  width * 0.05,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: width * 0.2,
                      width: width * 0.2,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            "assets/icons/icon.png",
                          ),
                        ),
                      ),
                    ),
                    TextWidget(
                      size: width * 0.1,
                      color: ColorsClass.green,
                      data: "App Name",
                    ),
                    TextField(
                      controller: _loginController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Login',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    // const SizedBox(height: 16),
                    TextField(
                      controller: _passwordController,
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Parol',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    // const SizedBox(height: 32),
                    CustomButton(
                      btnColor: ColorsClass.buttonBackgroundColor,
                      btnText: "Kirish",
                      onTap: () {
                        LoginClass.login(
                          _loginController,
                          _passwordController,
                          context,
                        );
                      },
                      width: width,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
