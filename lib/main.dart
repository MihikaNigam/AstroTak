import 'package:astro_tak/repositories/ask_question_repository.dart';
import 'package:astro_tak/repositories/profile_repository.dart';
import 'package:astro_tak/screens/askQuestions/ask_question.dart';
import 'package:astro_tak/screens/profile/profile_screen.dart';
import 'package:astro_tak/screens/homescreen/navigation_screen.dart';
import 'package:astro_tak/utils/adaptive.dart';
import 'package:astro_tak/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:astro_tak/bloc/askQuestions/ask_questions_bloc.dart';

import 'bloc/profile/profile_bloc.dart';

void main() {
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Adaptive(
        builder: () => MaterialApp(
          navigatorKey: navigatorKey,
              title: 'Astro Tak',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                visualDensity: VisualDensity.adaptivePlatformDensity,
                fontFamily: 'Fieldwork',
                appBarTheme: const AppBarTheme(
                    actionsIconTheme: IconThemeData(color: primary),
                    iconTheme: IconThemeData(color: primary),
                    centerTitle: true,
                    backgroundColor: white,
                    elevation: 0),
                primarySwatch: primary,
              ),
              initialRoute: NavigationScreen.routeName,
              routes: {
                NavigationScreen.routeName: (context) =>
                    BlocProvider<AskQuestionsBloc>(
                      create: (context) => AskQuestionsBloc(
                          asqRepo: AskQuestionRepositoryImpl()),
                      child: const NavigationScreen(),
                    ),
                ProfileScreen.routeName: (context) => BlocProvider<ProfileBloc>(
                      create: (context) =>
                          ProfileBloc(profileRepo: ProfileRepositoryImpl()),
                      child: const ProfileScreen(),
                    ),
                //ProfileScreen.routeName: (ctx) => const ProfileScreen(),
              },
            ));
  }
}
