import 'package:flutter/material.dart';

class AllData {
  static var row = TextEditingController();
  static var column = TextEditingController();

  List alphabet = [];
  storeinlist(int index, String value) {
    Map<int, String> insertVal = {index: value};
    if (checkvalue(index)) {
      for (var val in alphabet) {
        if (val.containsKey(index)) {
          val[index] = value;
        }
      }
    } else {
      alphabet.add(insertVal);
    }
  }

  bool checkvalue(int index) {
    if (alphabet.any((item) => item.containsKey(index))) {
      return true;
    }
    return false;
  }
}
