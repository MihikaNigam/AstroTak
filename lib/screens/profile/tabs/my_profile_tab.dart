import 'package:astro_tak/screens/profile/tabs/basic_profile_tab.dart';
import 'package:astro_tak/screens/profile/tabs/friends_family_tab.dart';
import 'package:astro_tak/utils/app_color.dart';
import 'package:flutter/material.dart';

class MyProfileTab extends StatelessWidget {
  const MyProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            height: 40,
            margin: const EdgeInsets.symmetric(vertical: 12),
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              labelPadding: const EdgeInsets.all(0),
              labelStyle: const TextStyle(fontSize: 13),
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: primary),
              labelColor: white,
              unselectedLabelColor: black.withOpacity(0.5),
              tabs: const [
                Tab(text: 'Basic Profile'),
                Tab(text: 'Friends and Family Profile'),
              ],
            ),
          ),
          const Expanded(
              child: TabBarView(
            children: [BasicProfileTab(), FriendsFamilyTab()],
          ))
        ],
      ),
    );
  }
}
