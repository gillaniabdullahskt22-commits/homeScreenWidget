import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

List<String> getCurrentWeekDates() {
  final now = DateTime.now();

  final int weekday = now.weekday; // Mon=1, Sun=7
  final monday = now.subtract(Duration(days: weekday - 1));

  return List.generate(7, (index) {
    final date = monday.add(Duration(days: index));
    return date.day.toString();
  });
}

int getCurrentDayIndex() {
  return DateTime.now().weekday - 1; // Mon=0, Sun=6
}
