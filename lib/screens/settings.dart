// ignore_for_file: use_build_context_synchronously

import 'package:fingerprint/consts/colors.dart';
import 'package:fingerprint/functions/delete.dart';
import 'package:fingerprint/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsClass.red.withOpacity(
          0.25,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: ColorsClass.red,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
        title: TextWidget(
          size: width * 0.07,
          color: ColorsClass.red,
          data: "Settings",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          right: width * 0.07,
          left: width * 0.07,
          top: width * 0.07,
        ),
        child: Column(
          children: [
//===========================================================================================
//================================= DELETE ALL OF FINGERPRINTS ==============================
//===========================================================================================
            ListTile(
              tileColor: ColorsClass.red.withOpacity(0.1),
              onTap: () {
                Get.defaultDialog(
                  title: "Delete all fingerprints",
                  titleStyle: TextStyle(
                    color: ColorsClass.red,
                    fontFamily: "Sumana",
                    fontSize: width * 0.05,
                  ),
                  content: Text(
                    "Are you sure you want to delete all fingerprints?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Sumana",
                      fontSize: width * 0.04,
                      color: ColorsClass.black.withOpacity(0.7),
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: TextWidget(
                        size: width * 0.04,
                        color: ColorsClass.red,
                        data: "No",
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        DeleteClass.deleteAll();
                        Get.back();
                      },
                      child: TextWidget(
                        size: width * 0.04,
                        color: ColorsClass.red,
                        data: "Yes",
                      ),
                    ),
                  ],
                );
              },
              leading: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
              title: TextWidget(
                size: width * 0.05,
                color: Colors.red,
                data: "Delete all finger",
              ),
            ),
            SizedBox(height: width * 0.02),
//===========================================================================================
//================================= DELETE ALL OF FINGERPRINTS ==============================
//===========================================================================================
          ],
        ),
      ),
    );
  }
}
