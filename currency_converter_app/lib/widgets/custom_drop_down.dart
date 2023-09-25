import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget CustomDropDown(List<String> items, String value, void onChange(val)) {
  return Container(
    child: DropdownButton<String>(
      value: value,
      onChanged: (String? val) {
        onChange(val!);
      },
      items: items.map<DropdownMenuItem<String>>((String val) {
        return DropdownMenuItem<String>(
          child: Text(val),
          value: val,
        );
      }).toList(), // Convert the mapped items to a list
    ),
  );
}