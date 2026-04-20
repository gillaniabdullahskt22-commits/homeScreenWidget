import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _weekDates = prefs.getStringList('ff_weekDates') ?? _weekDates;
    });
    _safeInit(() {
      _widgetTitle = prefs.getString('ff_widgetTitle') ?? _widgetTitle;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _weekDates = [];
  List<String> get weekDates => _weekDates;
  set weekDates(List<String> value) {
    _weekDates = value;
    prefs.setStringList('ff_weekDates', value);
  }

  void addToWeekDates(String value) {
    weekDates.add(value);
    prefs.setStringList('ff_weekDates', _weekDates);
  }

  void removeFromWeekDates(String value) {
    weekDates.remove(value);
    prefs.setStringList('ff_weekDates', _weekDates);
  }

  void removeAtIndexFromWeekDates(int index) {
    weekDates.removeAt(index);
    prefs.setStringList('ff_weekDates', _weekDates);
  }

  void updateWeekDatesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    weekDates[index] = updateFn(_weekDates[index]);
    prefs.setStringList('ff_weekDates', _weekDates);
  }

  void insertAtIndexInWeekDates(int index, String value) {
    weekDates.insert(index, value);
    prefs.setStringList('ff_weekDates', _weekDates);
  }

  int _selectedDayIndex = 0;
  int get selectedDayIndex => _selectedDayIndex;
  set selectedDayIndex(int value) {
    _selectedDayIndex = value;
  }

  String _widgetTitle = '';
  String get widgetTitle => _widgetTitle;
  set widgetTitle(String value) {
    _widgetTitle = value;
    prefs.setString('ff_widgetTitle', value);
  }

  String _widgetSubtitle = '';
  String get widgetSubtitle => _widgetSubtitle;
  set widgetSubtitle(String value) {
    _widgetSubtitle = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
