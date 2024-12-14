// ignore_for_file: use_build_context_synchronously

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetXController extends GetxController {
//=========================================================
//==================== Bottom NavBar ======================

  void saveEmployeeData({
    required BuildContext context,
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
      "name": name,
      "salary": salary,
      "profileIMG": profileIMG.isNotEmpty
          ? profileIMG
          : "https://www.clipartmax.com/png/middle/91-915439_to-the-functionality-and-user-experience-of-our-site-red-person-icon.png",
      "start": start,
      "end": end,
      "totalHours": int.tryParse(totalHours) ?? 0,
      "status": false,
      "date": "00",
      "time": "00",
    };

    databaseReference.child("${data.length}").set(employee).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Employee data saved successfully!")),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error saving data: $error")),
      );
    });
  }

//==================================================================
//==================== READ ALL EMPLOYEE DATA ======================
  final databaseRef = FirebaseDatabase.instance.ref("Employee");
  var data = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    listenToRealtimeDatabase();
    checkEmployee();
  }

  Future<void> listenToRealtimeDatabase() async {
    databaseRef.onValue.listen((event) {
      final employees = event.snapshot.value as List<dynamic>? ?? [];
      data.value = employees.map((e) => Map<String, dynamic>.from(e)).toList();
    });
  }

//============================================================
//==================== READ ALL FINGERS ======================
  final databaseFingers = FirebaseDatabase.instance.ref("fingerprints");
  var dataFingers = <String, dynamic>{}.obs;
  Future<void> checkEmployee() async {
    databaseFingers.onValue.listen(
      (event) {
        if (event.snapshot.value != null) {
          dataFingers.value = Map<String, dynamic>.from(
              event.snapshot.value as Map<dynamic, dynamic>);
          for (var i = 0; i < data.length; i++) {
            if (data[i]["finger"] == dataFingers["a_id"]) {
              databaseRef
                  .child("$i")
                  .child("finger")
                  .set(dataFingers["a_id"])
                  .then((_) {})
                  .catchError((error) {});
              databaseRef
                  .child("$i")
                  .child("date")
                  .set(dataFingers["b_datetamp"])
                  .then((_) {})
                  .catchError((error) {});
              databaseRef
                  .child("$i")
                  .child("time")
                  .set(dataFingers["c_timetamp"])
                  .then((_) {})
                  .catchError((error) {});
            }
          }
        } else {
          dataFingers.value = {};
        }
      },
    );
  }
}
