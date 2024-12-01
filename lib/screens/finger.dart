import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class FingerprintAuthScreen extends StatefulWidget {
  const FingerprintAuthScreen({super.key});

  @override
  FingerprintAuthScreenState createState() => FingerprintAuthScreenState();
}

class FingerprintAuthScreenState extends State<FingerprintAuthScreen> {
  final LocalAuthentication auth = LocalAuthentication();
  bool _isAuthenticated = false;

  Future<void> _authenticate() async {
    try {
      final bool didAuthenticate = await auth.authenticate(
        localizedReason: "ltimos maxsus joyga barmog'ingizni tekkizing",
        options: const AuthenticationOptions(
          biometricOnly: true,
        ),
      );
      setState(() {
        _isAuthenticated = didAuthenticate;
      });
    } catch (e) {
      Exception(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          "Fingerprint Authentication",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _isAuthenticated ? 'Tasdiqlandi' : 'Tasdiqlanmadi',
              style: TextStyle(
                fontSize: 24,
                color: _isAuthenticated ? Colors.green : Colors.red,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: _authenticate,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    height: 60,
                    width: 200,
                    child: const Text(
                      "Fingerprint",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
