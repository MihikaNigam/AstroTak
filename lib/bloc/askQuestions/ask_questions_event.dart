part of 'ask_questions_bloc.dart';

abstract class AskQuestionsEvent extends Equatable {
  const AskQuestionsEvent();
}

class GetCategoriesEvent extends AskQuestionsEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class CategoryChangedEvent extends AskQuestionsEvent {
  final int index;
  const CategoryChangedEvent({required this.index});
  @override
  List<Object?> get props => [index];
}
