import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

final _deviceInfo = DeviceInfoPlugin();

Future<bool> hasPdfSupport() async {
  if (kIsWeb) return true;
  if (Platform.isMacOS || Platform.isIOS || Platform.isWindows) {
    return true;
  }
  if (Platform.isAndroid) {
    final androidInfo = await _deviceInfo.androidInfo;
    return androidInfo.version.sdkInt >= 21;
  }
  return false;
}
