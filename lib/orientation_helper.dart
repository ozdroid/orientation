import 'package:flutter/services.dart';

import 'orientation.dart';

class OrientationHelper {
  static Future<void> setEnabledSystemUIOverlays(
      List<SystemUiOverlay> overlays) {
    return OrientationPlugin.setEnabledSystemUIOverlays(overlays);
  }

  static Future<void> setPreferredOrientations(
      List<DeviceOrientation> orientations) {
    return OrientationPlugin.setPreferredOrientations(orientations);
  }

  static Future<void> forceOrientation(DeviceOrientation orientation) {
    return OrientationPlugin.forceOrientation(orientation);
  }

  /// [DeviceOrientation.portraitUp] is default.
  static const DeviceOrientation initOrientation = DeviceOrientation.portraitUp;

  static Stream<DeviceOrientation>? _onOrientationChange;

  static Stream<DeviceOrientation>? get onOrientationChange {
    // ignore: prefer_conditional_assignment
    if (_onOrientationChange == null) {
      _onOrientationChange = OrientationPlugin.onOrientationChange!
          .distinct((previous, next) => previous == next);
    }
    return _onOrientationChange;
  }
}
