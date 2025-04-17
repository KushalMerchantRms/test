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

import 'package:visu_a_i_customer_1/flutter_flow/flutter_flow_widgets.dart';

import 'package:visu_a_i_customer_1/backend/api_requests/api_calls.dart';
import 'package:visu_a_i_customer_1/backend/api_requests/api_manager.dart';

import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CustomCalendarFace extends StatefulWidget {
  const CustomCalendarFace({
    super.key,
    this.width,
    this.height,
    this.fromDate,
  });

  final double? width;
  final double? height;
  final Future Function()? fromDate;

  @override
  State<CustomCalendarFace> createState() => _CustomCalendarFaceState();
}

class _CustomCalendarFaceState extends State<CustomCalendarFace> {
  @override
  Widget build(BuildContext context) {
    DateTime? startDate = FFAppState().StartDate;
    DateTime? endDate = FFAppState().EndDate;
    ApiCallResponse? faceapisuccessCustom;
    ApiCallResponse? apiResultCount;

    // Create a DateRangePicker selection range if dates are selected
    PickerDateRange? selectedRange;
    if (startDate != null && endDate != null) {
      selectedRange = PickerDateRange(startDate, endDate);
      print("$selectedRange");
    }

    return Container(
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Color(0xfff5f5f5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          SfDateRangePicker(
            monthViewSettings: DateRangePickerMonthViewSettings(
              showTrailingAndLeadingDates: true,
            ),
            onSelectionChanged: (v) {
              PickerDateRange data = v.value;
              FFAppState().update(() {
                FFAppState().StartDate = data.startDate;
                FFAppState().EndDate = data.endDate;
              });
              setState(() {}); // Trigger UI update
            },
            maxDate: DateTime.now(),
            headerHeight: 70,
            selectionRadius: 4,
            view: DateRangePickerView.month,
            selectionMode: DateRangePickerSelectionMode.range,
            todayHighlightColor: Color(0xff5f1178),
            selectionTextStyle:
                const TextStyle(color: Colors.white, fontSize: 17),
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
                borderRadius: BorderRadius.all(Radius.circular(10)),
                shape: BoxShape.rectangle,
              ),
            ),
            initialSelectedRange: selectedRange,
          ),

          // Apply Button (Shown only when endDate is selected)
          if (endDate != null)
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: FFButtonWidget(
                onPressed: () async {
                  print("enter");
                  faceapisuccessCustom = await OtherAPIsGroup.facesCall.call(
                    authToken: FFAppState().token,
                    branchId: FFAppState().storeID,
                    fromDate:
                        dateTimeFormat("yyyy-MM-dd", FFAppState().StartDate),
                    type: 0,
                    offset: 0,
                    limit: 5,
                    toDate: dateTimeFormat("yyyy-MM-dd", FFAppState().EndDate),
                    fromTime: '09:00:00',
                    toTime: '09:00:00',
                  );
                  if ((faceapisuccessCustom?.succeeded ?? true)) {
                    FFAppState().faceList =
                        (faceapisuccessCustom?.jsonBody ?? '')
                            .toList()
                            .cast<dynamic>();
                    FFAppState().update(() {});
                  }
                  safeSetState(() {});
                  Future(() async {
                    apiResultCount = await OtherAPIsGroup.facesCountCall.call(
                      branchId: FFAppState().storeID,
                      fromDate:
                          dateTimeFormat("yyyy-MM-dd", FFAppState().StartDate),
                      toDate:
                          dateTimeFormat("yyyy-MM-dd", FFAppState().EndDate),
                      authToken: FFAppState().token,
                    );

                    if ((apiResultCount?.succeeded ?? true)) {
                      FFAppState().faceCount = getJsonField(
                        (apiResultCount?.jsonBody ?? ''),
                        r'''$.count''',
                      );
                      FFAppState().update(() {});
                    }
                  });
                  FFAppState().FaceScreenState =
                      dateTimeFormat("yyyy-MM-dd", FFAppState().StartDate);
                  safeSetState(() {});
                  await widget.fromDate?.call();
                  Navigator.of(context, rootNavigator: true).pop();
                },
                text: 'Apply',
                options: FFButtonOptions(
                  width: 169,
                  height: 30,
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                  iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Inter',
                        color: Colors.white,
                        fontSize: 14,
                        letterSpacing: 0.0,
                      ),
                  elevation: 0,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
