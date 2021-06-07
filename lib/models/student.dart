import 'package:flutter/material.dart';

class Student extends ChangeNotifier {
  String? _nom;
  String? _cognoms;

  Student.named(this._nom, this._cognoms);

  String get nom {
    if (_nom == null) throw Exception("El nom no s'ha especificat");
    return _nom!;
  }

  String get cognoms {
    if (_cognoms == null) throw Exception("Els cognoms no s'han especificat");
    return _cognoms!;
  }

  set nom(String value) {
    _nom = value;
    notifyListeners();
  }

  set cognoms(String value) {
    _cognoms = value;
    notifyListeners();
  }
}
