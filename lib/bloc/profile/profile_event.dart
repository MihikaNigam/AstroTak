part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class GetProfileEvent extends ProfileEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetRelativesListEvent extends ProfileEvent {
  @override
  List<Object?> get props => [];
}

class DeleteRelativeEvent extends ProfileEvent {
  final String uuid;
  const DeleteRelativeEvent({required this.uuid});
  @override
  List<Object?> get props => [];
}

class EditRelativeEvent extends ProfileEvent {
  @override
  List<Object?> get props => [];
}

class AddRelativeEvent extends ProfileEvent {
  AddRelativeRequest addRelativeRequest;
  AddRelativeEvent({required this.addRelativeRequest});
  @override
  List<Object?> get props => [];
}

class GetLocationEvent extends ProfileEvent {
  final String searchkey;
  const GetLocationEvent({required this.searchkey});
  @override
  List<Object?> get props => [];
}
