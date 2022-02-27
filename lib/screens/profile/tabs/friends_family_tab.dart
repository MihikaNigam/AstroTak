import 'package:astro_tak/bloc/profile/profile_bloc.dart';
import 'package:astro_tak/models/profile/get_relatives_response.dart';
import 'package:astro_tak/screens/profile/components/add_new_relative_form.dart';
import 'package:astro_tak/screens/profile/components/friends_family_list.dart';
import 'package:astro_tak/screens/profile/components/update_relative.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FriendsFamilyTab extends StatefulWidget {
  const FriendsFamilyTab({Key? key}) : super(key: key);

  @override
  State<FriendsFamilyTab> createState() => _FriendsFamilyTabState();
}

class _FriendsFamilyTabState extends State<FriendsFamilyTab> {
  int indextoShow = 0;
  @override
  void initState() {
    BlocProvider.of<ProfileBloc>(context).add(GetRelativesListEvent());
    super.initState();
  }

  // Relatives r = Relatives(
  //     birthDetails: BirthDetails(
  //         dobDay: "1",
  //         dobMonth: "1",
  //         dobYear: "1800",
  //         meridiem: "PM",
  //         tobHour: "",
  //         tobMin: "0"),
  //     birthPlace: BirthPlace(
  //       placeId: "",
  //       placeName: "",
  //     ),
  //     dateAndTimeOfBirth: "",
  //     firstName: "",
  //     fullName: "",
  //     gender: "",
  //     lastName: "",
  //     middleName: "",
  //     relation: "",
  //     relationId: "0",
  //     totalPages: "",
  //     uuid: "");
  // GlobalKey _children = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: indextoShow,
      children: [
        FriendsFamilyList(setIndex: setIndex, updatefunc: toUpdate),
        AddNewProfile(setIndex: setIndex),
        // UpdateRelative(setIndex: setIndex, r: r)
      ],
    );
  }

  setIndex(int i) {
    indextoShow = i;
    //if (i != 2) {
    BlocProvider.of<ProfileBloc>(context).add(GetRelativesListEvent());
    //}
  }

  toUpdate(Relatives data) {
    // this.r = data;
  }
}
