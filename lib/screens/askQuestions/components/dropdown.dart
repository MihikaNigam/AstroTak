import 'package:astro_tak/utils/app_color.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:astro_tak/bloc/askQuestions/ask_questions_bloc.dart';

class CustomDropDown extends StatefulWidget {
  final List<dynamic> dropdownitems;
  final myfunc;
  CustomDropDown({Key? key, required this.dropdownitems, this.myfunc})
      : super(key: key);

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  dynamic dropdownvalue;
  @override
  void initState() {
    dropdownvalue = widget.dropdownitems.isNotEmpty
        ? widget.dropdownitems.elementAt(0)
        : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("rebuilding dropdown");
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        value: dropdownvalue,
        onChanged: (dynamic? newValue) {
          setState(() {
            dropdownvalue = newValue!;
          });
          BlocProvider.of<AskQuestionsBloc>(context).add(CategoryChangedEvent(
              index: widget.dropdownitems.indexOf(newValue!)));
          // widget.myfunc();
        },
        dropdownMaxHeight: 150,
        isExpanded: true,
        icon: const Icon(Icons.arrow_drop_down),
        items: widget.dropdownitems.map((dynamic items) {
          return DropdownMenuItem(value: items, child: Text("  $items"));
        }).toList(),
      ),
    );
  }

  currentVal() {
    return dropdownvalue;
  }
}
