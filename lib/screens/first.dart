import 'package:fingerprint/consts/colors.dart';
import 'package:fingerprint/consts/user_data.dart';
import 'package:fingerprint/screens/user_profile.dart';
import 'package:fingerprint/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return ListView.builder(
      itemCount: UserData.attendanceData.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: ColorsClass.red.withOpacity(0.2),
              child: TextWidget(
                size: width * 0.053,
                color: ColorsClass.red,
                data: UserData.attendanceData[index]['name']![0],
              ),
            ),
            title: TextWidget(
              size: width * 0.045,
              color: ColorsClass.black,
              data: UserData.attendanceData[index]['name'],
            ),
            subtitle: TextWidget(
              size: width * 0.035,
              color: ColorsClass.grey,
              data: UserData.attendanceData[index]['time'],
            ),
            trailing: TextWidget(
              size: width * 0.03,
              color: ColorsClass.red,
              data: UserData.attendanceData[index]['late'],
            ),
            onTap: () {
              Get.to(
                UserProfileScreen(
                  userData: UserData.attendanceData[index],
                ),
                transition: Transition.cupertino,
              );
            },
          ),
        );
      },
    );
  }
}
