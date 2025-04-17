import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

DateTime stringToDate(String string) {
  return DateTime.parse(string).toLocal();
}

List<dynamic> addNewDatainListTOP(
  List<dynamic> dataMain,
  List<dynamic> newData,
) {
// Keep only items from newData that are not already in dataMain
  final existingIds = dataMain.map((e) => e['id']).toSet();
  final toAdd = newData.where((e) => !existingIds.contains(e['id'])).toList();
  return [...toAdd, ...dataMain];
}

List<dynamic> addNewDatainList2(
  List<dynamic> dataMain,
  List<dynamic> newDataList,
  String targetLabel,
) {
  if (newDataList.isEmpty) return dataMain;

  // Extract the .data from the incoming list where label is null
  var incomingData = newDataList.firstWhere(
    (item) => item['label'] == null && item['data'] is List,
    orElse: () => null,
  );

  if (incomingData == null || incomingData['data'] == null) {
    print('Error: No valid data found in newDataList.');
    return dataMain;
  }

  List<dynamic> newData = incomingData['data'];

  // Find the item in dataMain that matches the target label
  var targetItem = dataMain.firstWhere(
    (item) => item['label'] == targetLabel,
    orElse: () => null,
  );

  if (targetItem != null) {
    // If the label exists, merge the new data into the existing .data list
    if (targetItem['data'] is List) {
      targetItem['data'].addAll(newData);
    } else {
      print('Error: The existing .data is not a list.');
    }
  } else {
    // If the label doesn't exist, create a new entry
    dataMain.add({
      'label': targetLabel,
      'data': newData,
    });
  }

  return dataMain;
}

String? formatDateRangeFace2(
  String? dateString,
  String? daySubtract,
) {
  if (dateString == null || dateString.isEmpty) return null;

  try {
    int daysToSubtract =
        int.tryParse(daySubtract ?? '0') ?? 0; // Convert daySubtract to int
    DateTime dateTime = DateFormat('yyyy-MM-dd HH:mm:ss').parse(dateString);
    DateTime adjustedDate = dateTime.subtract(Duration(days: daysToSubtract));
    return DateFormat('d MMM yyyy | h:mm a').format(adjustedDate);
  } catch (e) {
    return null; // Return null if parsing fails
  }
}

String? imageTOstring(String? image) {
  return image.toString();
}

String? getRangeOfDate(String duration) {
  DateTime currentDate = DateTime.now();
  DateTime fromDate;

  switch (duration) {
    case 'Last 2 days':
      fromDate = currentDate.subtract(Duration(days: 2));
      break;
    case 'Last 3 days':
      fromDate = currentDate.subtract(Duration(days: 3));
      break;
    case 'Last 7 days':
      fromDate = currentDate.subtract(Duration(days: 7));
      break;
    case 'Last 2 weeks':
      fromDate = currentDate.subtract(Duration(days: 14));
      break;
    case 'Last 30 days':
      fromDate = currentDate.subtract(Duration(days: 30));
      break;
    case 'Life Time':
      fromDate = DateTime(1970);
      break;
    default:
      fromDate = DateTime(1970);
  }

  DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  String formattedFromDate = dateFormat.format(fromDate);

  return formattedFromDate;
}

String? dateToString(DateTime? date) {
  DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  String formattedFromDate = dateFormat.format(date!);

  return formattedFromDate;
}

String? getRangeOfDateFace(
  String duration,
  String? currentDateString,
) {
  DateTime currentDate = currentDateString != null
      ? DateFormat('yyyy-MM-dd').parse(currentDateString)
      : DateTime.now();
  DateTime fromDate;

  switch (duration) {
    case 'Last 1 days':
      fromDate = currentDate.subtract(Duration(days: 1));
      break;
    case 'Last 3 days':
      fromDate = currentDate.subtract(Duration(days: 3));
      break;
    case 'Last 6 days':
      fromDate = currentDate.subtract(Duration(days: 6));
      break;
    case 'Last 2 weeks':
      fromDate = currentDate.subtract(Duration(days: 14));
      break;
    case 'Last 29 days':
      fromDate = currentDate.subtract(Duration(days: 29));
      break;
    case 'Life Time':
      fromDate = DateTime(1970);
      break;
    default:
      fromDate = DateTime(1970);
  }

  DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  String formattedFromDate = dateFormat.format(fromDate);

  return formattedFromDate;
}

String? formatDateString(String? date) {
  DateTime parsedDate = DateTime.parse(date!);

  // Determine the correct suffix for the day
  String suffix = 'th';
  final int digit = parsedDate.day % 10;
  if ((digit > 0 && digit < 4) &&
      (parsedDate.day < 11 || parsedDate.day > 13)) {
    suffix = <String>['st', 'nd', 'rd'][digit - 1];
  }

  // Format the date using DateFormat with the correct suffix
  return "${parsedDate.day}$suffix ${DateFormat('MMMM, yyyy').format(parsedDate)}";
}

String getImage(String? binaryValue) {
  return "data:image/png;base64,$binaryValue!";
}

bool? getAlertData(DateTime? dateToCheck) {
  final DateTime currentDate = DateTime.now();

  // Calculate the date 5 days ago
  final DateTime fiveDaysAgo = currentDate.subtract(Duration(days: 5));

  // Check if the given date falls within the range of the last 5 days
  return dateToCheck!.isAfter(fiveDaysAgo) && dateToCheck.isBefore(currentDate);
}

String? getAvatarById(
  List<dynamic> data,
  int id,
) {
  final user = data.firstWhere(
    (element) => element['id'] == id,
    orElse: () => {},
  );

  // Return the avatar if the user is found; otherwise, return null
  return user.isNotEmpty ? user['avatar'] as String? : null;
}

dynamic updatedMainJson(
  dynamic data,
  List<dynamic> audit,
) {
  dynamic updatedJson = {
    "id": data['id'],
    "uuid": data['uuid'],
    "incident_time": data['incident_time'],
    "photo_url": data['photo_url'],
    "video_url": data['video_url'],
    "suspicious_incidents": data['suspicious_incidents'],
    "name": data['name'],
    "status": data['status'],
    "comments": data['comments'],
    "is_blacklisted": data['is_blacklisted'],
    "blacklisted_on": data['blacklisted_on'],
    "audit": audit
  };

  return updatedJson;
}

List<dynamic> addNewDatainList(
  List<dynamic> dataMain,
  List<dynamic> newData,
) {
  dataMain.addAll(newData); // Merge the two lists

  return dataMain;
}

dynamic updatedMainMap(
  dynamic data,
  List<dynamic> audit,
) {
  List<Map<String, dynamic>> finalData;

  dynamic updatedJson = {
    "id": data['id'],
    "uuid": data['uuid'],
    "incident_time": data['incident_time'],
    "photo_url": data['photo_url'],
    "video_url": data['video_url'],
    "suspicious_incidents": data['suspicious_incidents'],
    "name": data['name'],
    "status": data['status'],
    "comments": data['comments'],
    "is_blacklisted": data['is_blacklisted'],
    "blacklisted_on": data['blacklisted_on'],
    "audit": audit
  };

  return updatedJson;
}

dynamic updateStatus(
  dynamic data,
  int? status,
  bool? isBlacklisted,
  int? auditid,
  int? actiontype,
  String? updatedat,
  int? userid,
  String? firstname,
  String? comments,
  int? statusAudit,
  bool? edited,
) {
  List<dynamic> audits = data['audit'] == null ? [] : List.from(data['audit']);

  // New audit entry to add
  dynamic newAuditEntry = {
    "audit_id": auditid,
    "action_type": actiontype,
    "updated_at": updatedat,
    "updated_by": {"user_id": userid, "first_name": firstname},
    "comments": comments,
    "status": statusAudit,
    "edited": edited
  };

  // Adding the new audit entry to the audit list
  audits.insert(0, newAuditEntry);

  dynamic updatedJson = {
    "id": data['id'],
    "uuid": data['uuid'],
    "incident_time": data['incident_time'],
    "photo_url": data['photo_url'],
    "video_url": data['video_url'],
    "suspicious_incidents": data['suspicious_incidents'],
    "name": data['name'],
    "status": status,
    "comments": data['comments'],
    "is_blacklisted": isBlacklisted,
    "blacklisted_on": data['blacklisted_on'],
    "audit": audits // Update the audit field with the new audit list
  };

  return updatedJson;
}

DateTime? formatDate(String? date) {
  // DateTime dateTime = DateFormat("MMMM d, yyyy HH:mm:ss").parse(date!);

  // return dateTime;
  if (date == null) return null; // Return null immediately if the input is null

  List<String> formats = [
    "MMMM dd, yyyy 'at' HH:mm:ss", // Format with 'at'
    "MMMM dd, yyyy HH:mm:ss" // Format without 'at'
  ];

  DateTime? dateTime; // Declare as nullable since it may not be set

  for (String format in formats) {
    try {
      dateTime = DateFormat(format).parse(date, true);
      break; // If parsing is successful, exit the loop
    } catch (e) {
      continue; // If parsing fails, try the next format
    }
  }

  return dateTime; // Return the parsed date or null if none of the formats matched
}

String? formatDateWithSuffix(String? date) {
  DateTime dateTime = DateFormat("MMMM d, yyyy HH:mm:ss").parse(date!);

  // Get the day of the month
  int day = dateTime.day;

  // Determine the suffix (st, nd, rd, th)
  String daySuffix;
  if (day >= 11 && day <= 13) {
    daySuffix = "th";
  } else if (day % 10 == 1) {
    daySuffix = "st";
  } else if (day % 10 == 2) {
    daySuffix = "nd";
  } else if (day % 10 == 3) {
    daySuffix = "rd";
  } else {
    daySuffix = "th";
  }

  // Format the DateTime object into the desired format
  String formattedDate = DateFormat("d MMMM, yyyy").format(dateTime);

  // Append the suffix to the day
  return formattedDate.replaceFirst(RegExp(r'\d+'), '$day$daySuffix');
}

List<int>? adjustList(List<int>? list) {
  if (list!.length == 6) {
    // Add 0 to the list if the condition is met
    list.clear();
    return list;
  }
  return list;
}

String? getDateRangeBasedOnGap(String duration) {
  DateTime currentDate = DateTime.now();
  DateTime fromDate;

  switch (duration) {
    case '3 days':
      fromDate = currentDate.subtract(Duration(days: 3));
      break;
    case '7 days':
      fromDate = currentDate.subtract(Duration(days: 7));
      break;
    case '2 weeks':
      fromDate = currentDate.subtract(Duration(days: 14));
      break;
    case '30 days':
      fromDate = currentDate.subtract(Duration(days: 30));
      break;

    default:
      fromDate = DateTime.now();
  }

  DateFormat dateFormat = DateFormat('yMMMd');
  String formattedFromDate = dateFormat.format(fromDate);
  String dateNow = dateFormat.format(DateTime.now());
  String finalDate = "$formattedFromDate - $dateNow";

  return finalDate;
}

bool? checkDateFormat(String? dateString) {
  DateFormat format =
      DateFormat("MMMM dd, yyyy 'at' HH:mm:ss"); // Define the specific format
  format.tryParse(dateString!); // Attempt to parse the date string
  return true; // Return true if parsing is successful
}

bool? checkEmail(String? email) {
  final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  return emailRegex.hasMatch(email!);
}

String? videopathTOstring(String? videoURL) {
  return videoURL;
}

String utf8convert(String text) {
  List<int> bytes = text.toString().codeUnits;
  return utf8.decode(bytes);
}

DateTime newStringtoDate(String dateStr) {
  final DateFormat format = DateFormat("MMMM dd, yyyy HH:mm:ss");
  return format.parse(dateStr);
}

String convertToISO8601(String dateStr) {
  final DateFormat inputFormat = DateFormat("MMMM dd, yyyy HH:mm:ss");
  DateTime dateTime = inputFormat.parse(dateStr);
  return dateTime.toIso8601String();
}

String? formatTo12HourTime(String? dateTimeString) {
// Parse the input string to a DateTime object
  DateTime dateTime = DateTime.parse(dateTimeString!);

  // Format the DateTime object to a 12-hour time with AM/PM
  String formattedTime = DateFormat('h:mm a').format(dateTime);

  return formattedTime;
}

String? conver24hourFormat(String time) {
  final inputFormat = DateFormat.jm(); // 'h:mm a'
  final outputFormat = DateFormat.Hms(); // 'HH:mm:ss'

  final dateTime = inputFormat.parse(time);
  final formattedTime = outputFormat.format(dateTime);

  return formattedTime;
}

String? formatDateRangeFace(
  String? dateString,
  String? daySubtract,
) {
  if (dateString == null || dateString.isEmpty) return null;

  try {
    int daysToSubtract =
        int.tryParse(daySubtract ?? '0') ?? 0; // Convert daySubtract to int
    DateTime dateTime = DateFormat('yyyy-MM-dd').parse(dateString);
    DateTime adjustedDate = dateTime.subtract(Duration(days: daysToSubtract));
    return DateFormat('d MMM yyyy').format(adjustedDate);
  } catch (e) {
    return null; // Return null if parsing fails
  }
}

String? lazyloadtimeface(String? dateStringLazy) {
  DateTime parsedDate = DateFormat("dd MMM, yyyy").parse(dateStringLazy!);
  return DateFormat("yyyy-MM-dd").format(parsedDate);
}
