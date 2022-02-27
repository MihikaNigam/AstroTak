import 'package:astro_tak/repositories/ask_question_repository.dart';
import 'package:astro_tak/screens/askQuestions/ask_question.dart';
import 'package:astro_tak/screens/profile/profile_screen.dart';
import 'package:astro_tak/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:astro_tak/bloc/askQuestions/ask_questions_bloc.dart';

class NavigationScreen extends StatefulWidget {
  static const routeName = '/navigation-screen';
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedPageIndex = 2;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  final List<Widget> _pages = [
    Container(),
    Container(),
    const AskQuestionScreen(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/icons/icon.png',
          scale: 8,
        ),
        leading: IconButton(
            onPressed: () {
              const Drawer();
            },
            icon: Image.asset(
              'assets/icons/hamburger.png',
              scale: 1.2,
            )),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(ProfileScreen.routeName);
            },
            child: Image.asset('assets/icons/profile.png', scale: 4),
          )
        ],
      ),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Image.asset('assets/icons/home.png', scale: 3),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Image.asset('assets/icons/talk.png', scale: 3),
              label: 'Talk'),
          BottomNavigationBarItem(
              icon: Image.asset('assets/icons/ask.png', scale: 3),
              label: 'Ask Question'),
          BottomNavigationBarItem(
              icon: Image.asset('assets/icons/reports.png', scale: 3),
              label: 'Reports'),
          BottomNavigationBarItem(
              icon: Image.asset('assets/icons/chat.png', scale: 3),
              label: 'Chat'),
        ],
        backgroundColor: white,
        currentIndex: _selectedPageIndex,
        selectedItemColor: primary,
        unselectedItemColor: grey,
        onTap: _selectPage,
        type: BottomNavigationBarType.shifting,
        showUnselectedLabels: true,
        unselectedLabelStyle: const TextStyle(overflow: TextOverflow.clip),
      ),
    );
  }
}
