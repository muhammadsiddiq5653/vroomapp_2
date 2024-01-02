import 'package:fluttermoji/fluttermoji.dart';
import 'package:vroom_app/app/modules/app_abstract_controller.dart';

class CustomizeAvatarController extends AppAbstractController {
  final FluttermojiFunctions fluttermojiFunctions = FluttermojiFunctions();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void save() async {
    // SvgPicture.string();
    var data = await fluttermojiFunctions.encodeMySVGtoString();
    print(data);
  }
}
