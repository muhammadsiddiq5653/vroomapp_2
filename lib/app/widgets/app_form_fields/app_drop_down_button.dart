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
              child: Wrap(
                children: <Widget>[
                  Text(title,
                      style: TextStyle(
                          color: AppColors.textDarkColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 18)),
                  SizedBox(
                    height: 40,
                  ),
                  ListView.builder(
                      itemCount: options.length,
                      padding: EdgeInsets.all(0),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            onChanged(options[index].value);
                            Get.back();
                          },
                          child: AppListTile(
                            leading: options[index].icon == null
                                ? Container()
                                : Icon(
                                    options[index].icon,
                                    color: AppColors.primary,
                                  ),
                            title: Text(
                              options[index].title,
                              style: TextStyle(
                                  color: AppColors.textDarkColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                            trailing: Container(),
                          ),
                        );
                      }),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            isScrollControlled: true);
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
                color: AppColors.textDarkColor,
                fontWeight: FontWeight.w500,
                fontSize: 14),
          ));
    }
    return Container(
      padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: AppColors.inactive)),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              getDefault()?.toString() ?? title,
              style: TextStyle(color: AppColors.textDarkColor, fontSize: 16),
            ),
          ),
          Icon(
            Remix.arrow_down_circle_fill,
            color: AppColors.primary,
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
        padding: EdgeInsets.only(top: 20),
        child: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
    );
  }
}
