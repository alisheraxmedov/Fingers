import 'package:fingerprint/consts/colors.dart';
import 'package:fingerprint/consts/pages.dart';
import 'package:fingerprint/functions/check_state.dart';
import 'package:fingerprint/screens/settings.dart';
import 'package:fingerprint/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fingerprint/screens/finger.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _selectedIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsClass.red.withOpacity(
          0.25,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: ColorsClass.red,
          ),
          onPressed: () {
            Get.to(
              const FingerprintAuthScreen(),
              transition: Transition.fade,
            );
          },
        ),
        title: TextWidget(
          size: width * 0.075,
          color: ColorsClass.red,
          data: 'Attendance',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(
                const SettingsScreen(),
                transition: Transition.downToUp,
                duration: const Duration(seconds: 1),
              );
            },
            icon: Icon(
              Icons.settings,
              color: Colors.red,
              size: width * 0.065,
            ),
          ),
          SizedBox(
            width: width * 0.05,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: width * 0.04,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTab("Today", 0, width),
                _buildTab("History", 1, width),
                _buildTab("Manage", 2, width),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                  if (_selectedIndex == 2) {
                    CheckState.updateStateToAdd();
                  } else {
                    CheckState.updateStateToCheck();
                  }
                });
              },
              children: PagesClass.pages,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String label, int index, double width) {
    return GestureDetector(
      onTap: () => _onTabTapped(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: _selectedIndex == index
                  ? ColorsClass.red
                  : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: TextWidget(
          size: width * 0.055,
          color: _selectedIndex == index ? ColorsClass.red : ColorsClass.black,
          data: label,
        ),
      ),
    );
  }
}
