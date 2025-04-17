// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:timezone/data/latest_all.dart'; // Import for timezone database
import 'package:timezone/timezone.dart'; // Import for working with timezones
import 'package:intl/intl.dart'; // Import for formatting dates

class TimezoneCurrentTime extends StatefulWidget {
  final String timeZone;
  final double? width;
  final double? height;

  const TimezoneCurrentTime({
    Key? key,
    required this.timeZone,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  _TimezoneCurrentTimeState createState() => _TimezoneCurrentTimeState();
}

class _TimezoneCurrentTimeState extends State<TimezoneCurrentTime> {
  String currentTime = 'Loading...';

  @override
  void initState() {
    super.initState();
    _getTimeInTimeZone(widget.timeZone);
  }

  // Helper method to get the ordinal suffix for a given day
  String _getOrdinalSuffix(int day) {
    if (day >= 11 && day <= 13) {
      return '${day}th'; // Handle special cases (11th, 12th, 13th)
    }
    switch (day % 10) {
      case 1:
        return '${day}st';
      case 2:
        return '${day}nd';
      case 3:
        return '${day}rd';
      default:
        return '${day}th';
    }
  }

  // Method to return the current time formatted for the given time zone
  void _getTimeInTimeZone(String timeZone) {
    try {
      // Initialize the timezone database
      initializeTimeZones();

      // Get the location from the timezone database using the provided timeZone string
      final location = getLocation(timeZone);

      // Get the current date and time in the specified time zone
      final currentDateTime = TZDateTime.now(location);

      // Get the day with the ordinal suffix
      final dayWithSuffix = _getOrdinalSuffix(currentDateTime.day);

      // Format the date and time with the ordinal suffix in the day
      String formattedDate = DateFormat("d MMMM, yyyy - h:mm a")
          .format(currentDateTime)
          .replaceFirst(RegExp(r'\d+'),
              dayWithSuffix); // Replace the day part with the day+suffix

      // Update the state with the formatted date
      setState(() {
        currentTime = formattedDate;
      });
    } catch (e) {
      // Update the state if there is an error
      print(">>>$e>>>");
      setState(() {
        currentTime = 'Invalid timezone';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      alignment: Alignment.centerLeft, // Center the text inside the container
      child: currentTime == 'Loading...' // Show loading text while waiting
          ? CircularProgressIndicator() // Show loading indicator while waiting
          : Text(
              currentTime, // Display the current time
              style: TextStyle(
                fontSize: 10, // You can adjust the font size
                color: Color(0xFF636363), // Adjust the color
                fontWeight: FontWeight.w500,
                fontFamily: 'Inter', // You can change the font family
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center, // Center the text
            ),
    );
  }
}
