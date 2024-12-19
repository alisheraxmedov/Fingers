import 'package:fingerprint/consts/colors.dart';
import 'package:fingerprint/functions/delete.dart';
import 'package:fingerprint/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileScreen extends StatelessWidget {
  final Map<String, dynamic> userData;
  const UserProfileScreen({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorsClass.red.withOpacity(0.1),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: ColorsClass.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          CircleAvatar(
            backgroundColor: ColorsClass.red.withOpacity(0.1),
            child: IconButton(
              icon: const Icon(
                Icons.delete,
                color: ColorsClass.red,
              ),
              onPressed: () {
                DeleteClass.deleteWithId(userData["finger"]);
              },
            ),
          ),
          SizedBox(
            width: width * 0.05,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
//===========================================================================
//============================ USER INFORMATION =============================
//===========================================================================
            Container(
              color: ColorsClass.red.withOpacity(0.1),
              width: width,
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      'https://www.clipartmax.com/png/middle/91-915439_to-the-functionality-and-user-experience-of-our-site-red-person-icon.png',
                    ),
                  ),
                  SizedBox(height: width * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${userData["name"] ?? "No defined"}",
                        style: TextStyle(
                          fontSize: width * 0.06,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Sumana",
                        ),
                      ),
                      SizedBox(width: width * 0.01),
                      Icon(
                        Icons.edit,
                        color: Colors.blue[400],
                        size: width * 0.055,
                      ),
                    ],
                  ),
                  SizedBox(width: width * 0.01),
                  Text(
                    "id: ${userData["finger"]} ",
                    style: const TextStyle(
                      color: ColorsClass.grey,
                      fontFamily: "Sumana",
                    ),
                  ),
                  SizedBox(height: width * 0.075),
                ],
              ),
            ),
            SizedBox(height: width * 0.05),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
//===========================================================================
//=============================== CONTAINER 1 ===============================
//===========================================================================
                  Container(
                    width: width,
                    height: width * 0.4,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE0E5EC),
                      borderRadius: BorderRadius.circular(width * 0.05),
                      boxShadow: [
                        const BoxShadow(
                          color: ColorsClass.white,
                          offset: Offset(-10, -10),
                          blurRadius: 15,
                          spreadRadius: 1,
                        ),
                        BoxShadow(
                          color: ColorsClass.black.withOpacity(0.2),
                          offset: const Offset(10, 10),
                          blurRadius: 15,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextWidget(
                              size: width * 0.09,
                              color: ColorsClass.black.withOpacity(0.3),
                              data: "General Info",
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: ColorsClass.red.withOpacity(0.3),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
//======================================================================================
                            Expanded(
                              child: ListTile(
                                title: TextWidget(
                                  size: width * 0.065,
                                  color: ColorsClass.black,
                                  data: "Salary",
                                ),
                                subtitle: TextWidget(
                                  size: width * 0.04,
                                  color: ColorsClass.grey,
                                  data: "${userData["salary"]}",
                                ),
                              ),
                            ),
//======================================================================================
                            Expanded(
                              child: ListTile(
                                title: TextWidget(
                                  size: width * 0.065,
                                  color: ColorsClass.black,
                                  data: "Hours",
                                ),
                                subtitle: TextWidget(
                                  size: width * 0.04,
                                  color: ColorsClass.grey,
                                  data: "${userData["totalHours"]} hrs",
                                ),
                              ),
                            ),
//======================================================================================
                            Expanded(
                              child: ListTile(
                                title: TextWidget(
                                  size: width * 0.065,
                                  color: ColorsClass.black,
                                  data: "Posit",
                                ),
                                subtitle: TextWidget(
                                  size: width * 0.04,
                                  color: ColorsClass.grey,
                                  data: "employee",
                                ),
                              ),
                            ),
//======================================================================================
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: width * 0.075),
//===========================================================================
//=============================== CONTAINER 2 ===============================
//===========================================================================
                  Container(
                    width: width,
                    height: width * 0.4,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE0E5EC),
                      borderRadius: BorderRadius.circular(width * 0.05),
                      boxShadow: [
                        const BoxShadow(
                          color: ColorsClass.white,
                          offset: Offset(-10, -10),
                          blurRadius: 15,
                          spreadRadius: 1,
                        ),
                        BoxShadow(
                          color: ColorsClass.black.withOpacity(0.2),
                          offset: const Offset(10, 10),
                          blurRadius: 15,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextWidget(
                              size: width * 0.09,
                              color: ColorsClass.black.withOpacity(0.3),
                              data: "Today's Info",
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: ColorsClass.red.withOpacity(0.3),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
//======================================================================================
                            Expanded(
                              child: ListTile(
                                title: TextWidget(
                                  size: width * 0.05,
                                  color: ColorsClass.black,
                                  data: "Salary",
                                ),
                                subtitle: TextWidget(
                                  size: width * 0.04,
                                  color: ColorsClass.grey,
                                  data: "\$123",
                                ),
                              ),
                            ),
//======================================================================================
                            Expanded(
                              child: ListTile(
                                title: TextWidget(
                                  size: width * 0.05,
                                  color: ColorsClass.black,
                                  data: "Begin",
                                ),
                                subtitle: TextWidget(
                                  size: width * 0.04,
                                  color: ColorsClass.grey,
                                  data: "${userData["time"]}",
                                ),
                              ),
                            ),

//======================================================================================
                            Expanded(
                              child: ListTile(
                                title: TextWidget(
                                  size: width * 0.05,
                                  color: ColorsClass.black,
                                  data: "Late",
                                ),
                                subtitle: TextWidget(
                                  size: width * 0.04,
                                  color: ColorsClass.grey,
                                  data: "${userData["lately"]} min",
                                ),
                              ),
                            ),
//======================================================================================
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatColumn(
      String title, String value, double width, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
              fontSize: width * 0.07,
              fontWeight: FontWeight.bold,
              color: color),
        ),
        SizedBox(height: width * 0.001),
        Text(
          title,
          style: const TextStyle(
            color: ColorsClass.grey,
          ),
        ),
      ],
    );
  }
}


/*
Center(
              child: Column(
                children: [

            SizedBox(height: width * 0.075),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatColumn(
                  'Salary',
                  '${userData["salary"]}',
                  width,
                  Colors.red.shade300,
                ),
                _buildStatColumn(
                  'Working Hours',
                  '160hrs',
                  width,
                  Colors.green.shade300,
                ),
                _buildStatColumn(
                  'Lateness',
                  '5hrs',
                  width,
                  Colors.pink.shade300,
                ),
              ],
            ),
            const Divider(thickness: 1),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.06,
                vertical: width * 0.01,
              ),
              child: Text(
                'Until today',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: width * 0.065,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatColumn(
                    'Current salary', '\$1220', width, Colors.red.shade300),
                _buildStatColumn(
                    'Working Hours', '76hrs', width, Colors.green.shade300),
                _buildStatColumn(
                    'Lateness', '5hrs', width, Colors.pink.shade300),
              ],
            ),
            // Settings Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: width * 0.075),
                  Text(
                    'Settings',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.065,
                    ),
                  ),
                  const Divider(thickness: 1),
                  ListTile(
                    leading: const Icon(Icons.location_city),
                    title: const Text('Primary city'),
                    trailing: const Text(
                      'New York',
                      style: TextStyle(
                        color: ColorsClass.blue,
                      ),
                    ),
                    onTap: () {},
                  ),
                  const Divider(thickness: 1),
                ],
              ),
            ),

 */