import 'dart:convert';

import 'package:astro_tak/bloc/profile/profile_bloc.dart';
import 'package:astro_tak/models/profile/add_relative_request.dart';
import 'package:astro_tak/models/profile/get_location_response.dart';
import 'package:astro_tak/models/profile/get_relatives_response.dart';
import 'package:astro_tak/screens/profile/components/lists.dart';
import 'package:astro_tak/screens/profile/components/reactive_dropdown.dart';
import 'package:astro_tak/utils/app_color.dart';
import 'package:astro_tak/widgets/button.dart';
import 'package:astro_tak/widgets/default_container.dart';
import 'package:astro_tak/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:http/http.dart' as http;

import '../../../main.dart';

class UpdateRelative extends StatefulWidget {
  final Function setIndex;
  final Relatives r;
  const UpdateRelative({Key? key, required this.setIndex, required this.r})
      : super(key: key);

  @override
  State<UpdateRelative> createState() => _UpdateRelativeState();
}

class _UpdateRelativeState extends State<UpdateRelative> {
  var maxyear = DateTime.now().year.toInt();
  final _formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var hourController = TextEditingController();
  var minController = TextEditingController();
  var dateController = TextEditingController();
  var monthController = TextEditingController();
  var yearController = TextEditingController();
  var pobController = TextEditingController();
  bool isAM = true;
  toggleAmPm() {
    isAM = !isAM;
    setState(() {});
  }

  List<dynamic> possibleGenders = genders;
  List<dynamic> possibleRelations = relations;
  dynamic selectedGender = genders[0];
  dynamic selectedRelation = relations[0];
  LocationData selectedloc = LocationData(placeId: "", placeName: "");
  @override
  void initState() {
    nameController.text = widget.r.firstName + widget.r.lastName;
    hourController.text = widget.r.birthDetails.tobHour;
    minController.text = widget.r.birthDetails.tobMin;
    dateController.text = widget.r.birthDetails.dobDay;
    monthController.text = widget.r.birthDetails.dobMonth;
    yearController.text = widget.r.birthDetails.dobYear;
    isAM = widget.r.birthDetails.meridiem == "AM" ? true : false;
    pobController.text = widget.r.birthPlace.placeName;
    selectedloc = LocationData(
        placeName: widget.r.birthPlace.placeName,
        placeId: widget.r.birthPlace.placeId);
    selectedGender = widget.r.gender == "MALE" ? "Male" : "Female";
    selectedRelation = relations[widget.r.relationId - 1];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 5, right: 5),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  onPressed: () => widget.setIndex(0),
                ),
                const Text(
                  "Add New Profile",
                  style: TextStyle(fontSize: 18, color: black),
                )
              ],
            ),
            const SizedBox(height: 25),
            Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DefaultContainer(
                      widget: Input(
                        errorMessage: "Enter Name",
                        maxLine: 1,
                        controller: nameController,
                        validationfunc: (String? s) {
                          if (s == null || s.length == 0) {
                            return 'Please enter valid value';
                          }
                          return null;
                        },
                      ),
                      label: "Name"),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: DefaultContainer(
                            widget: Input(
                              keyboardtype: TextInputType.number,
                              errorMessage: "Enter date",
                              maxLine: 1,
                              hint: "DD",
                              maxLength: 2,
                              controller: dateController,
                              validationfunc: (String? s) {
                                if (s == null ||
                                    s.length == 0 ||
                                    int.parse(s) > 31 ||
                                    int.parse(s) < 1) {
                                  return 'invalid';
                                }
                                return null;
                              },
                            ),
                            label: "Date of Birth"),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: DefaultContainer(
                            widget: Input(
                                keyboardtype: TextInputType.number,
                                errorMessage: "Enter month",
                                maxLine: 1,
                                hint: "MM",
                                maxLength: 2,
                                validationfunc: (String? s) {
                                  if (s == null ||
                                      s.length == 0 ||
                                      int.parse(s) > 12 ||
                                      int.parse(s) < 1) {
                                    return 'invalid';
                                  }
                                  return null;
                                },
                                controller: monthController),
                            label: ""),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: DefaultContainer(
                            widget: Input(
                              keyboardtype: TextInputType.number,
                              errorMessage: "Enter year",
                              maxLine: 1,
                              hint: "YYYY",
                              controller: yearController,
                              maxLength: 4,
                              validationfunc: (String? s) {
                                if (s == null ||
                                    s.length == 0 ||
                                    int.parse(s) > maxyear ||
                                    int.parse(s) < 1800) {
                                  return 'invalid';
                                }
                                return null;
                              },
                            ),
                            label: ""),
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: DefaultContainer(
                            widget: Input(
                              keyboardtype: TextInputType.number,
                              errorMessage: "Enter hour",
                              maxLine: 1,
                              maxLength: 2,
                              hint: "HH",
                              validationfunc: (String? s) {
                                if (s == null ||
                                    s.length == 0 ||
                                    int.parse(s) > 12 ||
                                    int.parse(s) < 1) {
                                  return 'invalid';
                                }
                                return null;
                              },
                              controller: hourController,
                            ),
                            label: "Time of Birth"),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: DefaultContainer(
                            widget: Input(
                              keyboardtype: TextInputType.number,
                              errorMessage: "Enter month",
                              maxLine: 1,
                              maxLength: 2,
                              hint: "MM",
                              validationfunc: (String? s) {
                                if (s == null ||
                                    s.length == 0 ||
                                    int.parse(s) > 59 ||
                                    int.parse(s) < 0) {
                                  return 'invalid';
                                }
                                return null;
                              },
                              controller: minController,
                            ),
                            label: ""),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                          child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => toggleAmPm(),
                            child: Material(
                              elevation: 2,
                              child: Container(
                                //width: double.negativeInfinity,
                                height: 49,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 16),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: isAM ? purple : white,
                                ),
                                child: Text(
                                  "AM",
                                  style: TextStyle(color: isAM ? white : black),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => toggleAmPm(),
                            child: Material(
                              elevation: 2,
                              child: Container(
                                //width: double.negativeInfinity,
                                height: 49,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 16),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: !isAM ? purple : white,
                                ),
                                child: Text(
                                  "PM",
                                  style:
                                      TextStyle(color: !isAM ? white : black),
                                ),
                              ),
                            ),
                          )
                        ],
                      ))
                    ],
                  ),
                  const SizedBox(height: 15),
                  DefaultContainer(
                      widget: TypeAheadFormField<LocationData>(
                        minCharsForSuggestions: 1,
                        // autovalidateMode: AutovalidateMode.onUserInteraction,
                        textFieldConfiguration:
                            TextFieldConfiguration(controller: pobController),
                        itemBuilder: (context, suggestion) {
                          return suggestion.placeId == ""
                              ? const Text("No suggestions")
                              : ListTile(
                                  title: Text(suggestion.placeName.toString()),
                                );
                        },
                        onSuggestionSelected: (LocationData? suggestion) {
                          selectedloc = suggestion!;
                          pobController.text = suggestion.placeName.toString();
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Invalid";
                          }
                          return null;
                        },

                        suggestionsCallback: (String pattern) {
                          return _getSuggestion(pattern);
                        },
                      ),
                      label: "Place of Birth"),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: DefaultContainer(
                            widget: ReactiveDropdown(
                              dropdownvalue: selectedGender,
                              dropdownitems: possibleGenders,
                            ),
                            label: "Gender"),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: DefaultContainer(
                            widget: ReactiveDropdown(
                              dropdownvalue: selectedRelation,
                              dropdownitems: possibleRelations,
                            ),
                            label: "Relation"),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                  const SizedBox(height: 30),
                  CustomButton(
                    onPressed: onsubmitted,
                    text: "Save Changes",
                    buttonWidth: 120,
                    textColor: white.withOpacity(0.7),
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<LocationData>> _getSuggestion(String hintText) async {
    String url =
        "https://staging-api.astrotak.com/api/location/place?inputPlace=$hintText";

    http.Response response =
        await http.get(Uri.parse(url), headers: {"Accept": "application/json"});

    if (response.statusCode != 200) {
      return [];
    }
    List<LocationData> suggestedWords = [];
    GetLocationResponse ans =
        GetLocationResponse.fromJson(jsonDecode(response.body));

    ans.data.forEach((f) => suggestedWords.add(f));

    return suggestedWords;
  }

  onsubmitted() {
    if (nameController == null &&
        dateController == null &&
        monthController == null &&
        yearController == null &&
        pobController == null &&
        hourController == null &&
        monthController == null) {
      _showSnackBar(context, "Please fill all the fields");
      return;
    }
    if (pobController.text != selectedloc.placeName) {
      _showSnackBar(context, "Please fill place of birth correctly");
      return;
    }
    try {
      BirthDetails bd = BirthDetails(
          dobYear: int.parse(yearController.text),
          dobMonth: int.parse(monthController.text),
          dobDay: int.parse(dateController.text),
          tobHour: int.parse(hourController.text),
          tobMin: int.parse(minController.text),
          meridiem: isAM ? "AM" : "PM");
      BirthPlace bp = BirthPlace(
          placeName: selectedloc.placeName, placeId: selectedloc.placeId);
      AddRelativeRequest req = AddRelativeRequest(
          birthDetails: bd,
          birthPlace: bp,
          firstName: nameController.text.trim().split(" ").first,
          gender: selectedGender == "Female" ? "FEMALE" : "MALE",
          lastName: nameController.text.trim().split(" ").length == 1
              ? ""
              : nameController.text.trim().split(" ").last,
          relationId: relations.indexOf(selectedRelation) + 1);
      print(jsonEncode(req));
      BlocProvider.of<ProfileBloc>(context)
          .add(AddRelativeEvent(addRelativeRequest: req));
      nameController.dispose();
      hourController.dispose();
      minController.dispose();
      yearController.dispose();
      monthController.dispose();
      dateController.dispose();
      pobController.dispose();
      widget.setIndex(0);
    } catch (e) {
      print(e);
    }
  }

  void _showSnackBar(BuildContext context, String? message) {
    final snackBar = SnackBar(content: Text(message == null ? "" : message));
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(snackBar);
  }
}
