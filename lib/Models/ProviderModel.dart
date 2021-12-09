import 'package:apod/Methods/sharedPrefs.dart';
import 'package:apod/Utils/UtilsFunctions.dart';
import 'package:flutter/material.dart';

class ProviderModel extends ChangeNotifier {
  Color _themeColor = Colors.black;
  DateTime _selectedDate = DateTime.now();

  ProviderModel() {
    getSavedDateFromSharedPrefs().then((value) {
      setTheme = ColorOfDay(weekday: value.weekday);
      setSelectedDate = value;
    });
  }
  set setTheme(Color themeColor) {
    _themeColor = themeColor;
    notifyListeners();

  }

  get getThemecolor => _themeColor;


  set setSelectedDate(DateTime dt) {
    saveDateToSharedPrefs(dt);
    setTheme = ColorOfDay(weekday: dt.weekday);
    _selectedDate = dt;
    notifyListeners();
  }

  get getSelectedDate => _selectedDate;

}
