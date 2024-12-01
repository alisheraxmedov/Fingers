// ignore_for_file: use_build_context_synchronously

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetXController extends GetxController {
//=========================================================
//==================== Bottom NavBar ======================

  void saveEmployeeData({
    required BuildContext context,
    required String id,
    required String name,
    required String salary,
    required String profileIMG,
    required String start,
    required String end,
    required String totalHours,
    required bool status,
  }) {
    final DatabaseReference databaseReference =
        FirebaseDatabase.instance.ref("Employee");

    Map<String, dynamic> employee = {
      "ID": id,
      "name": name,
      "salary": salary,
      "profileIMG": profileIMG.isNotEmpty
          ? profileIMG
          : "https://www.clipartmax.com/png/middle/91-915439_to-the-functionality-and-user-experience-of-our-site-red-person-icon.png",
      "start": start,
      "end": end,
      "totalHours": int.tryParse(totalHours) ?? 0,
      "status": false,
    };

    databaseReference.set(employee).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Employee data saved successfully!")),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error saving data: $error")),
      );
    });
  }

//=========================================================
//==================== Bottom NavBar ======================
  var data = {}.obs;

  final DatabaseReference _databaseRef =
      FirebaseDatabase.instance.ref("Employee");

  @override
  void onInit() {
    super.onInit();
    fetchRealtimeData();
  }

  Future<void> fetchRealtimeData() async {
    try {
      final event = await _databaseRef.once();
      if (event.snapshot.value != null) {
        data.value = Map<String, dynamic>.from(event.snapshot.value as Map);
      } else {
        data.value = {};
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
  }
}
