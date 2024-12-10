import 'package:fingerprint/consts/colors.dart';
import 'package:fingerprint/getx/get.dart';
import 'package:fingerprint/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  final GetXController getXController = Get.find();

  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      await getXController.listenToRealtimeDatabase();
      await getXController.checkEmployee();
      Get.off(() => const HomeScreen());
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: ColorsClass.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: width * 0.7,
              width: width * 0.7,
              child: Icon(
                Icons.person,
                size: width * 0.4,
                color: ColorsClass.grey,
              ),
            ),
            SizedBox(height: height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Walpaper",
                  style: TextStyle(
                    fontSize: width * 0.08,
                    fontWeight: FontWeight.bold,
                    color: ColorsClass.red,
                  ),
                ),
                Text(
                  " APP",
                  style: TextStyle(
                    fontSize: width * 0.08,
                    fontWeight: FontWeight.bold,
                    color: ColorsClass.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
