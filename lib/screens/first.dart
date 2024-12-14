// import 'package:fingerprint/consts/colors.dart';
// import 'package:fingerprint/consts/user_data.dart';
// import 'package:fingerprint/getx/get.dart';
// import 'package:fingerprint/screens/user_profile.dart';
// import 'package:fingerprint/widgets/text.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class FirstScreen extends StatelessWidget {
//   const FirstScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final GetXController controller = Get.put(GetXController());
//     final double width = MediaQuery.sizeOf(context).width;
//     return Obx(() {
//       return ListView.builder(
//         itemCount: controller.data.length,
//         itemBuilder: (context, index) {
//           return Card(
//             margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//             child: ListTile(
//               leading: CircleAvatar(
//                 backgroundColor: ColorsClass.red.withOpacity(0.2),
//                 child: TextWidget(
//                   size: width * 0.053,
//                   color: ColorsClass.red,
//                   data: controller.data[index]["name"],
//                 ),
//               ),
//               title: TextWidget(
//                 size: width * 0.045,
//                 color: ColorsClass.black,
//                 data: UserData.attendanceData[index]['name'],
//               ),
//               subtitle: TextWidget(
//                 size: width * 0.035,
//                 color: ColorsClass.grey,
//                 data: UserData.attendanceData[index]['time'],
//               ),
//               trailing: TextWidget(
//                 size: width * 0.03,
//                 color: ColorsClass.red,
//                 data: UserData.attendanceData[index]['late'],
//               ),
//               onTap: () {
//                 Get.to(
//                   UserProfileScreen(
//                     userData: UserData.attendanceData[index],
//                   ),
//                   transition: Transition.cupertino,
//                 );
//               },
//             ),
//           );
//         },
//       );
//     });
//   }
// }

import 'package:fingerprint/consts/colors.dart';
import 'package:fingerprint/functions/diff_time.dart';
import 'package:fingerprint/getx/get.dart';
import 'package:fingerprint/screens/user_profile.dart';
import 'package:fingerprint/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GetXController controller = Get.put(GetXController());
    final double width = MediaQuery.sizeOf(context).width;

    return Obx(() {
      return ListView.builder(
        itemCount: controller.data.length,
        itemBuilder: (context, index) {
          final employee = controller.data[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(employee["profileIMG"]),
                backgroundColor: ColorsClass.red.withOpacity(0.2),
              ),
              title: TextWidget(
                size: width * 0.045,
                color: ColorsClass.black,
                data: employee['name'],
              ),
              subtitle: TextWidget(
                size: width * 0.035,
                color: ColorsClass.grey,
                data:
                    "working hours: ${employee['start']} - ${employee["end"]}",
              ),
              trailing: TextWidget(
                size: width * 0.03,
                color: ColorsClass.red,
                data:
                    "${DifferentTimeClass.calculateMinutes(employee['start'], employee['time'])} min",
              ),
              onTap: () {
                Get.to(
                  UserProfileScreen(
                    userData: employee,
                  ),
                  transition: Transition.fade,
                );
                // Add navigation or action for employee details
              },
            ),
          );
        },
      );
    });
  }
}
