import 'package:get/get.dart';
import 'package:vroom_app/app/data/models/user_model.dart';
import 'package:vroom_app/app/modules/app_abstract_controller.dart';

import '../../../app_constants.dart';
import '../../../app_enums.dart';
import '../../../app_exception.dart';
import '../../../data/api/app_users_api.dart';
import '../../../data/models/envelope_model.dart';
import '../../../routes/app_pages.dart';

class LeaderboardController extends AppAbstractController {
  final AppUsersApi appUsersApi = Get.put(AppUsersApi());
  EnvelopeModel<UserModel>? users;
  List<UserModel> getTop3() {
    return [
      UserModel(email: 'ddd'),
      UserModel(email: 'ddd'),
      UserModel(email: 'ddd'),
    ];
    int end = (users?.collection.length ?? 0) > 2
        ? 3
        : (users?.collection.length ?? 0);
    return users?.collection.sublist(0, end) ?? [];
  }

  var showFor = [
    {'id': 0, 'name': 'Wins'},
    {'id': 1, 'name': 'Cars'},
    {'id': 2, 'name': 'Value'},
  ];

  int showForId = 0;

  List<UserModel> getAfterTop3() {
    return [
      UserModel(email: 'ddd'),
      UserModel(email: 'ddd'),
      UserModel(email: 'ddd'),
      UserModel(email: 'ddd'),
      UserModel(email: 'ddd'),
      UserModel(email: 'ddd'),
    ];
    if ((users?.collection.length ?? 0) < 4) return [];
    return users?.collection.sublist(3, users?.collection.length ?? 3) ?? [];
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    loadUsers();
  }

  @override
  void onClose() {}

  Future<bool> loadUsers({page = 1}) async {
    try {
      loadingState = GeneralLoadingState.done;
      update();
      return true;

      if (page == 1) {
        loadingState = GeneralLoadingState.waiting;
        update();
      }
      var result = await appUsersApi.getAll(
          page: page, type: showFor[showForId]['id'] as int);
      if (page == 1) {
        users = result;
        if ((users?.collection.length ?? 0) == 0) {
          loadingState = GeneralLoadingState.empty;
        } else {
          loadingState = GeneralLoadingState.done;
        }
      } else {
        users!.haveNext = result.haveNext;
        users!.currentPage = result.currentPage;
        users!.collection.addAll(result.collection);
      }
      update();
      return true;
    } catch (ex, stack) {
      captureException(ex, stackTrace: stack);
      loadingState = GeneralLoadingState.error;
      update();
      return false;
    }
  }

  void gotoUser(UserModel p1) {
    Get.toNamed(Routes.PROFILE,
        arguments: {AppConstants.profilePageArgument: p1});
  }

  void setShowForIndex(int index) {
    showForId = index;
    loadUsers();
    update();
  }
}
