import 'package:firebase_database/firebase_database.dart';

class DeleteClass {
  static final DatabaseReference database = FirebaseDatabase.instance.ref();
  static void deleteAll() async {
    try {
      await database.child('Sinov/state').set("tozalash");
      print("Qurilma muvaffaqiyatli tozalandi");
    } catch (e) {
      print('Xatolik yuz berdi: $e');
    }
  }

  static void deleteWithId(String id) async {
    try {
      await database.child('Sinov').set({
        "state": "o'chirish",
        "id": id,
      });
      print("Employee muvaffaqiyatli o'chirildi");
    } catch (e) {
      print('Xatolik yuz berdi: $e');
    }
  }
}
