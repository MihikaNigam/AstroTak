part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileLoadingState extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileErrorState extends ProfileState {
  final String message;

  const ProfileErrorState({required this.message});

  @override
  List<Object> get props => [];
}

class ProfileLoadedState extends ProfileState {
  @override
  List<Object> get props => [];
}

class RelativesLoadedState extends ProfileState {
  List<Relatives> relativesList;
  RelativesLoadedState({required this.relativesList});
  @override
  List<Object> get props => [];
}

class RelativeDeletedState extends ProfileState {
  final String message;
  final bool success;

  const RelativeDeletedState({required this.message, required this.success});

  @override
  List<Object> get props => [];
}

class RelativeAddedState extends ProfileState {
  final String message;
  final bool success;

  const RelativeAddedState({required this.message, required this.success});

  @override
  List<Object> get props => [];
}

class LocationLoadedState extends ProfileState {
  List<LocationData> locationList;
  LocationLoadedState({required this.locationList});
  @override
  List<Object> get props => [];
}
