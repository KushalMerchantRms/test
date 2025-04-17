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

// Imports custom functions
import 'package:timezone/data/latest_all.dart';
import 'package:timezone/timezone.dart';

class TimeDifferenceText extends StatefulWidget {
  final String timestamp; // Timestamp with timezone (ISO 8601 format)
  final String timeZone; // Timezone for current time calculation
  final double width;
  final double height;

  const TimeDifferenceText({
    Key? key,
    required this.timestamp,
    required this.timeZone,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  _TimeDifferenceTextState createState() => _TimeDifferenceTextState();
}

class _TimeDifferenceTextState extends State<TimeDifferenceText> {
  late String timeDifference;

  @override
  void initState() {
    super.initState();
    timeDifference = getTimeDifference(widget.timestamp, widget.timeZone);
  }

  String getTimeDifference(String timestamp, String timeZone) {
    // Initialize time zone database
    initializeTimeZones();

    // Parse the timestamp (includes a timezone offset)
    DateTime givenTime = DateTime.parse(timestamp);

    // Get the current time in the specified timezone
    Location location = getLocation(timeZone);
    DateTime currentTimeInZone = TZDateTime.now(location);

    // Convert timezone-aware `currentTimeInZone` to a naive DateTime
    DateTime naiveCurrentTime = DateTime(
      currentTimeInZone.year,
      currentTimeInZone.month,
      currentTimeInZone.day,
      currentTimeInZone.hour,
      currentTimeInZone.minute,
      currentTimeInZone.second,
    );

    // Debugging output
    print("Given Time          : $givenTime");
    print("Current Time in Zone: $currentTimeInZone ($timeZone)");
    print("Naive Current Time  : $naiveCurrentTime (No Timezone)");

    // Calculate the difference
    Duration difference = naiveCurrentTime.difference(givenTime);
    print(difference);
    // Format the output
    if (difference.inSeconds < 60) {
      return "${difference.inSeconds} seconds ago";
    } else if (difference.inMinutes < 60) {
      return "${difference.inMinutes} minutes ago";
    } else if (difference.inHours < 24) {
      return "${difference.inHours} hours ago";
    } else if (difference.inDays < 30) {
      return "${difference.inDays} days ago";
    } else if (difference.inDays < 365) {
      return "${(difference.inDays / 30).floor()} months ago";
    } else {
      return "${(difference.inDays / 365).floor()} years ago";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      alignment: Alignment.centerLeft,
      child: Text(
        timeDifference,
        style: const TextStyle(
          fontSize: 8,
          fontWeight: FontWeight.w700,
          fontFamily: 'Inter',
        ),
      ),
    );
  }
}
