import 'dart:async';
import 'package:astro_tak/models/askQuestion/get_categories_response.dart';
import 'package:astro_tak/repositories/ask_question_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
part 'ask_questions_event.dart';
part 'ask_questions_state.dart';

class AskQuestionsBloc extends Bloc<AskQuestionsEvent, AskQuestionsState> {
  final AskQuestionRepository asqRepo;
  AskQuestionsBloc({required this.asqRepo}) : super(AQSInitial());
  List<dynamic> categoryList = [];
  List<List<dynamic>> suggestionList = [];
  List<dynamic> price = [];
  @override
  Stream<AskQuestionsState> mapEventToState(
    AskQuestionsEvent event,
  ) async* {
    if (event is GetCategoriesEvent) {
      yield AQSLoadingState();
      try {
        GetCategoriesResponse? response = await asqRepo.getCategories();
        if (response!.httpStatusCode == 200 && response.data.isNotEmpty) {
          categoryList = response.data.map((e) => e.name).toList();
          suggestionList = response.data.map((e) => e.suggestions).toList();
          price = response.data.map((e) => e.price).toList();
          yield CategoriesLoadedState(categoryList: categoryList);
          event = const CategoryChangedEvent(index: 0);
        }
      } catch (e) {
        yield AQSErrorState(message: e.toString());
      }
    }
    if (event is CategoryChangedEvent) {
      try {
        yield CurrentCategoryLoadedState(
            price: price.elementAt(event.index),
            suggestion: suggestionList.elementAt(event.index));
      } catch (e) {
        AQSErrorState(message: e.toString());
      }
    }
  }
}
