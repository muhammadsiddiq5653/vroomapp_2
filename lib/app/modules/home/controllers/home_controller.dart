import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';
import 'package:vroom_app/app/app_colors.dart';
import 'package:vroom_app/app/app_constants.dart';
import 'package:vroom_app/app/app_enums.dart';
import 'package:vroom_app/app/data/api/app_cars_api.dart';
import 'package:vroom_app/app/data/models/car_model.dart';
import 'package:vroom_app/app/data/models/envelope_model.dart';
import 'package:vroom_app/app/modules/app_abstract_controller.dart';
import 'package:vroom_app/app/routes/app_pages.dart';
import 'package:vroom_app/app/widgets/app_bottom_sheet.dart';
import 'package:vroom_app/app/widgets/app_text/text_600.dart';

import '../../../widgets/app_text/text_400.dart';
import '../../../widgets/app_text/text_700.dart';

class HomeController extends AppAbstractController {
  AppCarsApi appCarsApi = Get.put(AppCarsApi());
  EnvelopeModel<CarModel>? cars;
  String? sort;
  String? searchQuery;
  var deleteCarConst = 'delete';
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    loadCards();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onCarTap(CarModel car) async {
    hideKeyboard();
    var result = await Get.toNamed(Routes.CARD_DETAILS,
        arguments: {AppConstants.carArgument: car});
    if (result == true) {
      loadCards();
    }
  }

  void onCarLongTap(CarModel car) async {
    try {
      hideKeyboard();
      var result = await Get.bottomSheet(AppBottomSheet(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Wrap(
            children: [
              Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Text700(
                      textAlign: TextAlign.center,
                      fontSize: 14,
                      text: 'Manage Your Wroom',
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 40),
                      child: GestureDetector(
                        onTap: () {
                          Get.back(result: deleteCarConst);
                        },
                        child: Row(
                          children: [
                            Icon(
                              Remix.delete_bin_fill,
                              color: AppColors.primary,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text400(
                              text: 'Delete this car',
                              fontSize: 16,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ));
      if (result == deleteCarConst) {
        EasyLoading.show();
        await appCarsApi.deleteUserCar(car.userCardId);
        EasyLoading.dismiss();
        loadCards();
      }
    } catch (ex) {
      dialogService.showError('Something went wrong, please try again');
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<bool> loadCards({int page = 1}) async {
    try {
      if (page == 1) {
        loadingState = GeneralLoadingState.waiting;
        update();
      }
      var result = await appCarsApi.getCars(
          page: page, sort: sort, searchQuery: searchQuery);
      if (page == 1) {
        cars = result;
        if ((cars?.collection.length ?? 0) == 0) {
          loadingState = GeneralLoadingState.empty;
        } else {
          loadingState = GeneralLoadingState.done;
        }
      } else {
        cars!.haveNext = result.haveNext;
        cars!.currentPage = result.currentPage;
        cars!.collection.addAll(result.collection);
      }
      settingsService.cars = cars!.collection;
      return true;
    } catch (ex) {
      loadingState = GeneralLoadingState.empty;
      return false;
    } finally {
      update();
    }
  }

  void scanCar() async {
    await Get.toNamed(Routes.SCAN_CAR);
    loadCards();
  }

  void sortOption() async {
    var options = [
      {'name': 'Default', 'icon': Remix.calendar_2_fill, 'sort': null},
      {'name': 'By name', 'icon': Remix.list_unordered, 'sort': 'name'},
      {
        'name': 'By price',
        'icon': Remix.money_dollar_circle_fill,
        'sort': 'price'
      },
      {'name': 'By Power', 'icon': Remix.car_fill, 'sort': 'engine_power'},
      {
        'name': 'By mileage',
        'icon': Remix.gas_station_fill,
        'sort': 'city_milage'
      },
      {'name': 'By weight', 'icon': Remix.scales_2_fill, 'sort': 'weight'},
    ];
    sort = await Get.bottomSheet(AppBottomSheet(
        child: Wrap(
      children: [
        ListView.builder(
            itemCount: options.length,
            shrinkWrap: true,
            itemBuilder: (_, index) {
              var item = options[index];
              return GestureDetector(
                onTap: () {
                  Get.back(result: item['sort'] as String?);
                },
                child: Container(
                  color: Colors.transparent,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  width: double.infinity,
                  child: Row(
                    children: [
                      Icon(
                        item['icon'] as IconData,
                        color: AppColors.primary,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text400(
                        text: item['name'] as String,
                        fontSize: 14,
                      )
                    ],
                  ),
                ),
              );
            })
      ],
    )));
    // if (sort == null) return;
    loadCards();
  }

  searchChanged(String p1) {
    searchQuery = p1;
    loadCards();
  }
}
