import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ReactiveDropdown extends StatefulWidget {
  final List<dynamic> dropdownitems;
  dynamic dropdownvalue;
  ReactiveDropdown({Key? key, required this.dropdownitems, this.dropdownvalue})
      : super(key: key);

  @override
  State<ReactiveDropdown> createState() => _ReactiveDropdownState();
}

class _ReactiveDropdownState extends State<ReactiveDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        onChanged: (dynamic? newValue) {
          setState(() {
            widget.dropdownvalue = newValue!;
          });
        },
        value: widget.dropdownvalue,

        //dropdownMaxHeight: 150,
        isExpanded: true,
        icon: const Icon(Icons.arrow_drop_down),
        items: widget.dropdownitems.map((dynamic items) {
          return DropdownMenuItem(value: items, child: Text("  $items"));
        }).toList(),
      ),
    );
  }
}
