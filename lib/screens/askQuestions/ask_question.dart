import 'package:astro_tak/repositories/ask_question_repository.dart';
import 'package:astro_tak/utils/app_color.dart';
import 'package:astro_tak/widgets/button.dart';
import 'package:astro_tak/widgets/default_container.dart';
import 'package:astro_tak/screens/askQuestions/components/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:astro_tak/bloc/askQuestions/ask_questions_bloc.dart';

import 'components/helpers.dart';
import 'components/question_box.dart';
import 'components/suggestion_list.dart';

class AskQuestionScreen extends StatefulWidget {
  static const routeName = '/ask-questions-screen';
  const AskQuestionScreen({Key? key}) : super(key: key);

  @override
  State<AskQuestionScreen> createState() => _AskQuestionScreenState();
}

class _AskQuestionScreenState extends State<AskQuestionScreen> {
  int currindex = 0;
  int walletBalance = 0;
  List<dynamic> dropdownitems = [];
  dynamic questionPrice = 0;
  List<dynamic> suggns = [];

  final textController = TextEditingController();
  setTextControllerValue(String ques) {
    setState(() {
      textController.text = ques;
    });
  }

  @override
  void initState() {
    BlocProvider.of<AskQuestionsBloc>(context).add(GetCategoriesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AskQuestionsBloc, AskQuestionsState>(
        listener: (context, state) {
      if (state is CategoriesLoadedState) {
        dropdownitems = state.categoryList;
      }
      if (state is CurrentCategoryLoadedState) {
        questionPrice = state.price;
        suggns = state.suggestion;
      }
    }, builder: (context, state) {
      if (state is AQSLoadingState) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is AQSErrorState) {
        return Center(child: Text(state.message));
      }
      return Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            color: purple,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Wallet Balance: ₹ $walletBalance',
                  style: const TextStyle(
                      letterSpacing: 1.5,
                      fontSize: 15,
                      color: white,
                      fontWeight: FontWeight.w800),
                ),
                const CustomButton(
                  text: 'Add Money',
                  borderColor: black,
                  textColor: purple,
                  buttonColor: white,
                  onPressed: null,
                  buttonWidth: 100,
                  buttonHeight: 26,
                  fontSize: 11,
                )
              ],
            ),
          ),
          Expanded(
              child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text('Ask a Question',
                          style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 15,
                              color: black,
                              fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(quesinfo,
                          style: const TextStyle(
                              letterSpacing: 1,
                              fontSize: 13,
                              color: black,
                              fontWeight: FontWeight.w400)),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text('Choose Category',
                          style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 15,
                              color: black,
                              fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      alignment: Alignment.center,
                      child: DefaultContainer(
                        widget: CustomDropDown(
                          dropdownitems: dropdownitems,
                        ),
                      ),
                    ),
                    QuestionTextBox(tc: textController),
                    const SizedBox(height: 15),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text('Ideas what to Ask (Select Any)',
                          style: TextStyle(
                              letterSpacing: 1,
                              fontSize: 15,
                              color: black,
                              fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 8),
                    SuggestionList(
                      suggList: suggns,
                      myfunc: setTextControllerValue,
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(extrainfo,
                          style: const TextStyle(
                              letterSpacing: 1,
                              fontSize: 13,
                              color: black,
                              fontWeight: FontWeight.w400)),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      color: primary.withOpacity(0.2),
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          for (String s in promoList)
                            Text(
                              s,
                              style: const TextStyle(
                                  color: primary, fontSize: 14, height: 1.3),
                            )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 10, bottom: 8),
                child: const FloatingActionButton(
                  onPressed: null,
                  child: Icon(
                    Icons.menu,
                    color: white,
                  ),
                  backgroundColor: primary,
                ),
              ),
            ],
          )),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
                color: purple, borderRadius: BorderRadius.circular(10)),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '₹ $questionPrice (1 Question on love)',
                  style: TextStyle(
                    fontSize: 13,
                    color: white.withOpacity(0.8),
                  ),
                ),
                CustomButton(
                  text: 'Ask Now',
                  borderColor: black,
                  textColor: purple,
                  buttonColor: white,
                  onPressed: null,
                  buttonWidth: 90,
                  buttonHeight: 30,
                  fontSize: 14,
                )
              ],
            ),
          ),
        ],
      );
    });
  }
}
