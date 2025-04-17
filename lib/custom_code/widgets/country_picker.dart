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
import 'package:country_picker/country_picker.dart';

class CountryPicker extends StatefulWidget {
  const CountryPicker({
    super.key,
    this.width,
    this.height,
    this.countryCode,
  });

  final double? width;
  final double? height;
  final String? countryCode;

  @override
  State<CountryPicker> createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
  String selectedCountry = "";

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        showCountryPicker(
          countryListTheme: CountryListThemeData(
            flagSize: 15,
            textStyle: TextStyle(fontSize: 17),
            bottomSheetHeight: MediaQuery.of(context).size.height / 2,
            inputDecoration: InputDecoration(
              hintText: 'Start typing to search',
              prefixIcon: const Icon(Icons.search),
            ),
          ),
          context: context,
          showPhoneCode: true, // optional to show phone code...
          onSelect: (Country country) {
            FFAppState().update(() {
              selectedCountry = "+${country.phoneCode}";
              FFAppState().CountryCode = selectedCountry;
              FFAppState().userCountryCode = selectedCountry;
            });
          },
        );
      },
      child: Container(
        width: double.infinity,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Color(0xFFBDBDBD),
          ),
        ),
        child: Align(
          alignment: AlignmentDirectional(0, 0),
          child: Text(
            widget.countryCode ?? 'Select a country',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  color: Color(0xFF464646),
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
      ),
    );
  }
}
