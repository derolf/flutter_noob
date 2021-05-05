import 'dart:async';

import 'package:flutter/foundation.dart';

///
/// A `[Listenable] that notifies its subscribers periodically.
///
class PeriodicListenable extends ChangeNotifier {
  ///
  /// Start the timer that regularily calles [notifyListeners].
  ///
  /// `delay`: parameter passed to [Timer.periodic]
  ///
  PeriodicListenable(Duration delay) {
    _timer = Timer.periodic(
      delay,
      (_) => notifyListeners(),
    );
  }

  ///
  /// Cancel the timer and dispose.
  ///
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  late final Timer _timer;
}
