// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:home_widget/home_widget.dart';

Future syncWeekWidgetData(
  List<String> weekDates,
  int selectedDayIndex,
) async {
  // Add your function code here!
  for (int i = 0; i < 7; i++) {
    await HomeWidget.saveWidgetData<String>(
      'widget_date_${i + 1}',
      i < weekDates.length ? weekDates[i] : '',
    );
  }

  await HomeWidget.saveWidgetData<int>(
    'selected_day_index',
    selectedDayIndex,
  );

  await HomeWidget.updateWidget(
    androidName: 'MyHomeWidgetProvider',
    qualifiedAndroidName: 'com.mycompany.homewidgettest.MyHomeWidgetProvider',
  );
}
