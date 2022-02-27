import 'dart:async';
import 'package:astro_tak/models/profile/add_relative_request.dart';
import 'package:astro_tak/models/profile/add_relative_response.dart';
import 'package:astro_tak/models/profile/delete_relative_response.dart';
import 'package:astro_tak/models/profile/get_location_response.dart';
import 'package:astro_tak/models/profile/get_relatives_response.dart';
import 'package:astro_tak/repositories/profile_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepo;
  ProfileBloc({required this.profileRepo}) : super(ProfileInitial());
  List<Relatives> relativesList = [];
  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if (event is GetProfileEvent) {}
    if (event is GetRelativesListEvent) {
      yield ProfileLoadingState();
      try {
        GetRelativesResponse? response = await profileRepo.getRelatives();
        if (response!.httpStatusCode == 200) {
          relativesList = response.data.allRelatives;
          yield RelativesLoadedState(relativesList: relativesList);
        }
      } catch (e) {
        yield ProfileErrorState(message: e.toString());
      }
    }
    if (event is DeleteRelativeEvent) {
      print("in event");
      try {
        DeleteRelativeResponse? response =
            await profileRepo.deleteRelative(event.uuid);

        yield RelativeDeletedState(
            message: response!.message, success: response.success);
      } catch (e) {
        yield ProfileErrorState(message: e.toString());
      }
    }
    if (event is GetLocationEvent) {
      try {
        GetLocationResponse? response =
            await profileRepo.getLocation(event.searchkey);
        yield LocationLoadedState(locationList: response?.data ?? []);
      } catch (e) {
        yield ProfileErrorState(message: e.toString());
      }
    }
    if (event is EditRelativeEvent) {}
    if (event is AddRelativeEvent) {
      print("here sucess");
      try {
        AddRelativeResponse? res =
            await profileRepo.addRelative(event.addRelativeRequest);

        yield RelativeAddedState(message: res!.message, success: res.success);
        event = GetRelativesListEvent();
      } catch (e) {
        yield ProfileErrorState(message: e.toString());
      }
    }
  }
}
