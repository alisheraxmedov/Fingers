import 'package:fingerprint/consts/colors.dart';
import 'package:flutter/material.dart';

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
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          CircleAvatar(
            backgroundColor: userData["status"]
                ? ColorsClass.green.withOpacity(0.15)
                : ColorsClass.red.withOpacity(0.15),
            child: userData["status"]
                ? Icon(
                    Icons.done_outline_rounded,
                    color: ColorsClass.green,
                  )
                : const Icon(
                    Icons.cancel,
                    color: ColorsClass.red,
                  ),
          ),
          SizedBox(
            width: width * 0.05,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
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
                  SizedBox(height: width * 0.01),
                  Text(
                    "${userData["email"] ?? "nodefined@gmail.com"}",
                    style: const TextStyle(
                      color: ColorsClass.grey,
                    ),
                  ),
                ],
              ),
            ),
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
