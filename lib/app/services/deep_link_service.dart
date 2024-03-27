import 'dart:async';
import 'package:get/get.dart';
import 'package:uni_links/uni_links.dart';

import '../app_exception.dart';

class DeepLinkService extends GetxService {
  StreamSubscription? _sub;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    _sub?.cancel();
    super.onClose();
  }

  Future<void> initUniLinks() async {
    try {
      final initialLink = await getInitialUri();
      handleLink(initialLink);
      _sub = uriLinkStream.listen(handleLink, onError: (err) {});
    } catch (ex, stack) {
      captureException(ex, stackTrace: stack);
    }
  }

  void handleLink(Uri? event) {
    if (event == null) return;
    Get.toNamed(event.path, parameters: event.queryParameters);
  }
}
