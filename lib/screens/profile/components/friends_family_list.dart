import 'package:astro_tak/bloc/profile/profile_bloc.dart';
import 'package:astro_tak/models/profile/get_relatives_response.dart';
import 'package:astro_tak/screens/profile/components/profile_tile.dart';
import 'package:astro_tak/utils/app_color.dart';
import 'package:astro_tak/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../main.dart';

class FriendsFamilyList extends StatelessWidget {
  final updatefunc;
  final Function setIndex;
  FriendsFamilyList({
    Key? key,
    required this.setIndex,
    this.updatefunc,
  }) : super(key: key);

  List<Relatives> relativesList = [];
  int walletBalance = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(listener: (context, state) {
      if (state is RelativesLoadedState) {
        relativesList = state.relativesList;
      }
      if (state is RelativeDeletedState) {
        if (state.success) {
          _showSnackBar(context, state.message);
          BlocProvider.of<ProfileBloc>(context).add(GetRelativesListEvent());
        } else {
          _showSnackBar(context, state.message);
        }
      }
      if (state is RelativeAddedState) {
        if (state.success) {
          _showSnackBar(context, state.message);
          BlocProvider.of<ProfileBloc>(context).add(GetRelativesListEvent());
        } else {
          _showSnackBar(context, state.message);
        }
      }
    }, builder: (context, state) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: purple.withOpacity(0.15),
                borderRadius: BorderRadius.circular(7)),
            padding: const EdgeInsets.all(10),
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.account_balance_wallet_rounded,
                    color: purple, size: 25),
                Text(
                  '  Wallet Balance: ₹ $walletBalance ',
                  style: TextStyle(
                      fontSize: 13.5,
                      color: purple.withOpacity(0.8),
                      fontWeight: FontWeight.w600),
                ),
                const CustomButton(
                  text: 'Add Money',
                  borderColor: black,
                  textColor: purple,
                  buttonColor: white,
                  onPressed: null,
                  buttonWidth: 90,
                  buttonHeight: 25,
                  fontSize: 11,
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 25, bottom: 10, left: 15),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  width: 70,
                  child: Text(
                    'Name',
                    style: TextStyle(color: purple.withOpacity(0.6)),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 10),
                  width: 70,
                  child: Text(
                    'DOB',
                    style: TextStyle(color: purple.withOpacity(0.6)),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 50,
                  child: Text(
                    'TOB',
                    style: TextStyle(color: purple.withOpacity(0.6)),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 70,
                  child: Text(
                    'Relation',
                    style: TextStyle(color: purple.withOpacity(0.6)),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              if (state is ProfileLoadingState)
                const Center(
                  child: CircularProgressIndicator(),
                ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: relativesList.length,
                    itemBuilder: (context, i) {
                      return Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          child: ProfileTiles(
                              e: relativesList[i],
                              updatefunc: updatefunc,
                              indexfunc: setIndex));
                    }),
              ),
              Positioned(
                bottom: 50,
                child: CustomButton(
                  text: "+ Add New Profile",
                  textColor: white.withOpacity(0.7),
                  onPressed: () => setIndex(1),
                ),
              )
            ],
          )),
        ],
      );
    });
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
