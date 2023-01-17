import 'package:flutter/foundation.dart';

void captureException(exception, {stackTrace}) async {
  try {
    print(exception);
    if (kReleaseMode) {
      // unawaited(Sentry.captureException(exception, stackTrace: stackTrace));
    }
  } catch (ex) {
    print(ex);
  }
}
