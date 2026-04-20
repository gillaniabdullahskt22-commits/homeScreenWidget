// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:home_widget/home_widget.dart';

Future updateHomeScreenWidget(
  String title,
  String subtitle,
) async {
  // Add your function code here!
  await HomeWidget.saveWidgetData<String>('widget_title', title);
  await HomeWidget.saveWidgetData<String>('widget_subtitle', subtitle);

  await HomeWidget.updateWidget(
    androidName: 'MyHomeWidgetProvider',
    qualifiedAndroidName: 'com.mycompany.homewidgettest.MyHomeWidgetProvider',
  );
}
