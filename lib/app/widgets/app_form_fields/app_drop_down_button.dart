import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:remixicon/remixicon.dart';
import 'package:vroom_app/app/app_colors.dart';

import '../app_bottom_sheet.dart';
import '../app_list_tile.dart';

class AppDropdownButton<T> extends StatelessWidget {
  final List<AppDropdownButtonItem<T>> options;
  final Function(T?) onChanged;
  final String title;
  final String popUptitle;
  final T? value;
  final isPill;

  const AppDropdownButton(
      {Key? key,
      required this.options,
      required this.onChanged,
      required this.title,
      required this.popUptitle,
      this.isPill = false,
      required this.value})
      : super(key: key);

  String? getDefault() {
    if (value != null) {
      return options.where((element) => element.value == value).first.title;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Get.bottomSheet(
          AppBottomSheet(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 24,
                        color: AppColors.surface,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Exo',
                        fontStyle: FontStyle.italic),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ListView.separated(
                    itemCount: options.length,
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          onChanged(options[index].value);
                          Get.back();
                        },
                        child: AppListTile(
                          containerColor: AppColors.cardColor,
                          padding: EdgeInsets.symmetric(
                            vertical: 25,
                            horizontal: 10,
                          ),
                          leading: options[index].icon == null
                              ? Container()
                              : Icon(
                                  Remix.car_fill,
                                  color: AppColors.primary,
                                ),
                          title: Text(
                            options[index].title,
                            style: TextStyle(
                                fontSize: 15,
                                color: AppColors.surface,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Exo',
                                fontStyle: FontStyle.italic),
                          ),
                          trailing: Container(),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 10,
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          ignoreSafeArea: false,
        );
      },
      child: _getBody(),
    );
  }

  Container _getBody() {
    if (isPill) {
      return Container(
          margin: EdgeInsets.only(right: 10),
          padding: EdgeInsets.fromLTRB(18, 10, 18, 10),
          decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(20)),
          child: Text(
            getDefault()?.toString() ?? title,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontFamily: 'Exo',
              fontStyle: FontStyle.italic,
            ),
          ));
    }
    return Container(
      padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 2, color: AppColors.primary),
          top: BorderSide(width: 2, color: AppColors.primary),
          right: BorderSide(width: 2, color: AppColors.primary),
          left: BorderSide(width: 2, color: AppColors.primary),
        ),
        borderRadius: BorderRadius.circular(10),
        color: Colors.transparent,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              getDefault()?.toString() ?? title,
              style: TextStyle(
                  fontSize: 16,
                  color: AppColors.surface,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Exo',
                  fontStyle: FontStyle.italic),
            ),
          ),
          Icon(
            Remix.arrow_down_line,
            color: AppColors.surface,
          )
        ],
      ),
    );
  }
}

class AppDropdownButtonItem<T> extends StatelessWidget {
  final T value;
  final String title;
  final IconData? icon;

  const AppDropdownButtonItem(
      {Key? key, required this.value, required this.title, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop(value);
      },
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
