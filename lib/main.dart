import 'package:fingerprint/firebase_options.dart';
import 'package:fingerprint/getx/get.dart';
import 'package:fingerprint/screens/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Get.put(GetXController());

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
// import 'package:fingerprint/firebase_options.dart';
// import 'package:fingerprint/getx/get.dart';
// import 'package:fingerprint/screens/home.dart';
// import 'package:fingerprint/screens/splash.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

//   Get.put(GetXController());

//   runApp(
//     const MyApp(),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: "/SplashScreen", // Boshlang'ich marshrutni belgilash
//       getPages: [
//         GetPage(
//           name: "/SplashScreen",
//           page: () => const SplashScreen(),
//         ),
//         GetPage(
//           name: "/HomeScreen",
//           page: () => const HomeScreen(), // HomeScreen classini aniqlang
//         ),
//       ],
//     );
//   }
// }
