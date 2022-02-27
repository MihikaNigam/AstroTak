import 'package:astro_tak/bloc/profile/profile_bloc.dart';
import 'package:astro_tak/main.dart';
import 'package:astro_tak/models/profile/get_relatives_response.dart';
import 'package:astro_tak/utils/app_color.dart';
import 'package:astro_tak/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileTiles extends StatefulWidget {
  final Relatives e;
  final updatefunc;
  final indexfunc;
  const ProfileTiles(
      {Key? key, required this.e, this.updatefunc, this.indexfunc})
      : super(key: key);

  @override
  _ProfileTilesState createState() => _ProfileTilesState();
}

class _ProfileTilesState extends State<ProfileTiles> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: grey.withOpacity(0.3), width: 2),
            borderRadius: BorderRadius.circular(5)),
        padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 5),
        width: double.infinity,
        child: Row(
          children: [
            Container(
              width: 65,
              alignment: Alignment.center,
              child: Text(
                widget.e.fullName,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: black.withOpacity(0.5), fontSize: 13),
              ),
            ),
            Container(
              width: 75,
              alignment: Alignment.center,
              child: Text(
                getDate(widget.e),
                //DateFormat("d-M-yyyy").format(widget.e.dob),
                style: TextStyle(color: black.withOpacity(0.5), fontSize: 12),
              ),
            ),
            Container(
              width: 50,
              alignment: Alignment.center,
              child: Text(
                getTime(widget.e),
                //DateFormat("H:mm").format(widget.e.tob),
                style: TextStyle(color: black.withOpacity(0.5), fontSize: 12),
              ),
            ),
            Container(
              width: 70,
              alignment: Alignment.center,
              child: Text(
                widget.e.relation,
                style: TextStyle(color: black.withOpacity(0.5), fontSize: 13),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                    onTap: () {
                      widget.updatefunc(widget.e);
                      widget.indexfunc(3);
                    },
                    child: const Icon(
                      Icons.edit,
                      size: 20,
                      color: primary,
                    )),
                const SizedBox(width: 20),
                GestureDetector(
                    onTap: () {
                      BlocProvider.of<ProfileBloc>(navigatorKey.currentContext!)
                          .add(DeleteRelativeEvent(uuid: widget.e.uuid));
                      //showAlertDialog(widget.e.uuid, context);
                    },
                    child: const Icon(
                      Icons.delete,
                      size: 20,
                      color: red,
                    )),
                const SizedBox(width: 10),
              ],
            )
          ],
        ),
      ),
    );
  }

  String getDate(Relatives e) {
    return "${e.birthDetails.dobDay}-${e.birthDetails.dobMonth}-${e.birthDetails.dobYear}";
  }

  String getTime(Relatives e) {
    return "${e.birthDetails.tobHour}:${e.birthDetails.tobMin}";
  }

  showAlertDialog(String uuid, context) {
    showDialog(
        context: navigatorKey.currentContext!,
        builder: (BuildContext context) {
          return AlertDialog(
            insetPadding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 24.0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: Center(
              child: Text(
                'Do you really want to Delete?',
                style: TextStyle(color: black.withOpacity(0.5), fontSize: 15),
              ),
            ),
            contentPadding: const EdgeInsets.fromLTRB(5.0, 20.0, 5.0, 24.0),
            content: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonBar(
                    children: [
                      CustomButton(
                        text: "YES",
                        textColor: white.withOpacity(0.7),
                        //buttonWidth: 130,
                        onPressed: () {
                          BlocProvider.of<ProfileBloc>(
                                  navigatorKey.currentContext!)
                              .add(DeleteRelativeEvent(uuid: uuid));
                          Navigator.of(navigatorKey.currentContext!).pop();
                        },
                      ),
                      CustomButton(
                        text: "NO",
                        //buttonWidth: 130,
                        textColor: white.withOpacity(0.7),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  ),
                ]),
          );
        });
  }
}
