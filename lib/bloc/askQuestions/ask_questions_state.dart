part of 'ask_questions_bloc.dart';

abstract class AskQuestionsState extends Equatable {
  const AskQuestionsState();
}

class AQSInitial extends AskQuestionsState {
  @override
  List<Object> get props => [];
}

class AQSLoadingState extends AskQuestionsState {
  @override
  List<Object> get props => [];
}

class AQSErrorState extends AskQuestionsState {
  final String message;

  const AQSErrorState({required this.message});

  @override
  List<Object> get props => [];
}

class CurrentCategoryLoadedState extends AskQuestionsState {
  final List suggestion;
  final dynamic price;

  const CurrentCategoryLoadedState({
    required this.suggestion,
    required this.price,
  });

  @override
  List<Object> get props => [suggestion, price];
}

class CategoriesLoadedState extends AskQuestionsState {
  final List categoryList;

  const CategoriesLoadedState({
    required this.categoryList,
  });

  @override
  List<Object> get props => [categoryList];
}
