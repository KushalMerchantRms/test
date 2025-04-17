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

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  @override
  Widget build(BuildContext context) {
    DateTime? startDate = FFAppState().StartDate;
    DateTime? endDate = FFAppState().EndDate;

    // Create a DateRangePicker selection range if dates are selected
    PickerDateRange? selectedRange;
    if (startDate != null && endDate != null) {
      selectedRange = PickerDateRange(startDate, endDate);
      print("$selectedRange");
    }

    return SfDateRangePicker(
      monthViewSettings: DateRangePickerMonthViewSettings(
        showTrailingAndLeadingDates: true,
      ),
      onSelectionChanged: (v) {
        PickerDateRange data = v.value;
        FFAppState().update(() {
          FFAppState().StartDate = data.startDate;
          FFAppState().EndDate = data.endDate;
        });
      },
      maxDate: DateTime.now(),
      headerHeight: 70,
      selectionRadius: 4,
      view: DateRangePickerView.month,
      selectionMode: DateRangePickerSelectionMode.range,
      todayHighlightColor: Color(0xff5f1178),
      selectionTextStyle: const TextStyle(color: Colors.white, fontSize: 17),
      headerStyle: DateRangePickerHeaderStyle(
          backgroundColor: Color(0xfff5f5f5),
          textAlign: TextAlign.center,
          textStyle: TextStyle(
              color: Color(0xff5f1178),
              fontWeight: FontWeight.w600,
              fontSize: 17)),
      selectionColor: Color(0xfff5f5f5),
      selectionShape: DateRangePickerSelectionShape.rectangle,
      startRangeSelectionColor: Color(0xff30884c),
      endRangeSelectionColor: Color(0xff30884c),
      rangeSelectionColor: Color(0xff48c47d),
      showNavigationArrow: true,
      backgroundColor: Color(0xfff5f5f5),
      viewSpacing: 10,
      rangeTextStyle: const TextStyle(color: Colors.white, fontSize: 17),
      showTodayButton: false,
      monthCellStyle: DateRangePickerMonthCellStyle(
        textStyle: TextStyle(color: Color(0xff848484)),
        todayTextStyle: TextStyle(color: Color(0xff5f1178)),
        todayCellDecoration: BoxDecoration(
          border: Border.all(color: Color(0xff5f1178)),
          borderRadius: BorderRadius.all(
              Radius.circular(10)), // Fill color for today's date
          shape: BoxShape.rectangle, // Shape of the today's date cell
        ),
      ),
      initialSelectedRange: selectedRange,
    );
  }
}
