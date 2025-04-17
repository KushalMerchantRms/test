// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart'; // Import for clipboard
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;

Future<void> downloadAndShare(
  String? fileUrl,
  String? caption,
  String? link,
) async {
  final String textToShare = '$caption \n$link '; // Text to share and copy

  // Copy to clipboard first
  await Clipboard.setData(ClipboardData(text: textToShare));
  if (kIsWeb) {
    // On the web, just share the link directly
    await Share.share(textToShare);
  } else {
    // For mobile, continue downloading and sharing the file
    try {
      String fileName = fileUrl!.split('/').last;
      var response = await http.get(Uri.parse(fileUrl));
      if (response.statusCode == 200) {
        Directory tempDir = await getTemporaryDirectory();
        File file = File('${tempDir.path}/$fileName');
        await file.writeAsBytes(response.bodyBytes);
        // Share the file with a line break in the text
        await Share.shareXFiles(
          text: textToShare,
          [XFile(file.path)],
        );
      } else {
        print("Failed to download file: ${response.statusCode}");
      }
    } catch (e) {
      print("Error downloading/sharing file: $e");
    }
  }
}
