import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class DateFormatter {
  String formatDateString(String date) {
    debugPrint('datetime ::::::::::::: $date');
    String dateStr = '2024-07-03T06:14:21Z';

    // Parse the string into a DateTime object
    DateTime dateTime = DateTime.parse(date);

    // Format the DateTime object to the desired format
    String formattedDate = DateFormat('yy:MM:dd HH:mm').format(dateTime);

    return formattedDate;
    print(formattedDate);  // Output: 24:07:03 06:14
  }
}