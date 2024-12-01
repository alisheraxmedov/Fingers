// ignore_for_file: use_build_context_synchronously

import 'package:fingerprint/consts/colors.dart';
import 'package:fingerprint/getx/get.dart';
import 'package:fingerprint/widgets/text.dart';
import 'package:fingerprint/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageScreen extends StatefulWidget {
  const ManageScreen({super.key});

  @override
  State<ManageScreen> createState() => _ManageScreenState();
}

class _ManageScreenState extends State<ManageScreen> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();
  final TextEditingController _startController = TextEditingController();
  final TextEditingController _endController = TextEditingController();
  final TextEditingController _totalHoursController = TextEditingController();
  final TextEditingController _profileImgController = TextEditingController();

  void _clearFields() {
    _idController.clear();
    _nameController.clear();
    _salaryController.clear();
    _startController.clear();
    _endController.clear();
    _totalHoursController.clear();
    _profileImgController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final GetXController getXController = Get.find();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextWidget(
          size: width * 0.07,
          color: ColorsClass.black,
          data: "Add Employee",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.1,
        ),
        child: ListView(
          children: [
            TextFieldWidget(controller: _idController, width: width),
            TextFieldWidget(controller: _nameController, width: width),
            TextFieldWidget(controller: _salaryController, width: width),
            TextFieldWidget(controller: _startController, width: width),
            TextFieldWidget(controller: _endController, width: width),
            TextFieldWidget(
              controller: _totalHoursController,
              width: width,
              ktype: TextInputType.number,
            ),
            TextFieldWidget(controller: _profileImgController, width: width),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          getXController.saveEmployeeData(
            context: context,
            name: _nameController.text,
            id: _idController.text,
            salary: "\$${_salaryController.text}",
            profileIMG:
                "https://www.clipartmax.com/png/middle/91-915439_to-the-functionality-and-user-experience-of-our-site-red-person-icon.png",
            start: _startController.text,
            end: _endController.text,
            totalHours: _totalHoursController.text,
            status: false,
          );
          _clearFields();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.1,
            vertical: width * 0.05,
          ),
          child: Container(
            alignment: Alignment.center,
            height: width * 0.15,
            width: width,
            decoration: BoxDecoration(
              color: ColorsClass.red.withOpacity(0.1),
              borderRadius: BorderRadius.circular(
                width * 0.1,
              ),
            ),
            child: TextWidget(
              size: width * 0.06,
              color: ColorsClass.red,
              data: "Save Employee",
            ),
          ),
        ),
      ),
    );
  }
}
