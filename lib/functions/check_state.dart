import 'package:firebase_database/firebase_database.dart';

class CheckState {
  static final DatabaseReference database = FirebaseDatabase.instance.ref();
  static void updateStateToAdd() async {
    try {
      await database.child('Sinov/state').set("saqlash");
      print("State muvaffaqiyatli o'zgartirildi: add");
    } catch (e) {
      print('Xatolik yuz berdi: $e');
    }
  }

  static void updateStateToCheck() async {
    try {
      await database.child('Sinov/state').set("tekshirish");
      print("State muvaffaqiyatli o'zgartirildi: tekshirish");
    } catch (e) {
      print('Xatolik yuz berdi: $e');
    }
  }
}
