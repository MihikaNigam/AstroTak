import 'package:astro_tak/screens/profile/tabs/my_profile_tab.dart';
import 'package:astro_tak/screens/profile/tabs/order_history_tab.dart';
import 'package:astro_tak/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:astro_tak/utils/app_color.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile-screen';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/icons/icon.png', scale: 9),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(15),
            child: CustomButton(
              text: 'Logout',
              textColor: primary.withOpacity(0.7),
              buttonColor: white,
              onPressed: null,
              buttonWidth: 70,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              TabBar(
                labelColor: primary.withOpacity(0.7),
                indicatorColor: primary.withOpacity(0.7),
                indicatorWeight: 1.8,
                unselectedLabelColor: black.withOpacity(0.5),
                tabs: const [
                  Tab(text: ' My Profile'),
                  Tab(text: 'Order History'),
                ],
              ),
              const Expanded(
                  child: TabBarView(
                children: [MyProfileTab(), OrderHistoryTab()],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
