import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vroom_app/app/app_constants.dart';

class AppUtilities {
  static bool isToday(DateTime date) {
    if (DateUtils.isSameDay(date, DateTime.now())) return true;
    return false;
  }

  static String dateToCoolString(DateTime? date) {
    if (date == null) return '';
    // date = date.toUtc();
    var today =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    if (date.isAtSameMomentAs(today)) return 'Today';
    var tommrow = today.add(Duration(days: 1));
    if (date.isAtSameMomentAs(tommrow)) return 'Tommorow';
    return DateFormat('EEEE, MMMM d').format(date);
  }

  static String dateToCoolStringWithHour(DateTime? date) {
    if (date == null) return '';
    var today =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    if (DateTime(date.year, date.month, date.day).isAtSameMomentAs(today)) {
      return 'Today @ ' + DateFormat('H:mm').format(date);
    }
    var tommrow = today.add(Duration(days: 1));
    if (DateTime(date.year, date.month, date.day).isAtSameMomentAs(tommrow)) {
      return 'Tommorow @ ' + DateFormat('H:mm').format(date);
    }

    return DateFormat('EE, d MMM @ H:mm').format(date);
  }

  static String dateToDayName(DateTime? date) {
    if (date == null) return '';
    return DateFormat('EE').format(date);
  }

  static String dateToDayFullName(DateTime date) {
    return DateFormat('EEEE').format(date);
  }

  static String dateToMonthName(DateTime date) {
    return DateFormat('MMMM').format(date);
  }

  static String dateSimple(DateTime? date) {
    if (date == null) return '';
    return DateFormat('y-MM-dd').format(date);
  }

  static String getHourNumber(int minute) {
    var number = minute / 60;
    var resut = number.toString().split('.');
    int? right = 0;
    if (resut.length > 1) {
      right = int.tryParse(resut[1]);
    }
    if (right != null && right > 0) {
      return number.toStringAsFixed(1);
    }
    return number.toString().split('.')[0];
  }

  static String getHour(String minutes) {
    var date =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    var duration = Duration(minutes: int.parse(minutes));
    date = date.add(duration);
    return DateFormat('H:mm').format(date);
  }

  static String ensureString(value) {
    if (value == null) return '';
    if (value is String) return value;
    return '';
  }

  static int? ensureInt(dynamic object) {
    switch (object.runtimeType) {
      case String:
        return int.tryParse(object as String);
      case int:
        return (object as int).toInt();
      case double:
        return (object as double).toInt();
      case bool:
        return object == true ? 1 : 0;
      default:
        return 0;
    }
  }

  static double ensureDouble(dynamic object) {
    if (object.toString().contains(','))
      object = object.replaceFirst(RegExp(','), '.');

    double? parsed = 0;
    if (object is String) parsed = double.tryParse(object);
    if (object is int) parsed = object.toDouble();
    if (object is int) parsed = object.toDouble();
    if (object is double) parsed = object.toDouble();
    return parsed == null ? 0.0 : parsed;
  }

  static String dateToDayNumber(DateTime? date) {
    if (date == null) return '';
    return DateFormat('d').format(date);
  }

  static String dateToHour(DateTime? date) {
    if (date == null) return '';
    return DateFormat('h:mm a').format(date);
  }

  static String fromTo(DateTime? date, int duration) {
    if (date == null) return '';
    var dateTo = date.add(Duration(minutes: duration));
    return DateFormat('h:mm a').format(date) +
        " - " +
        DateFormat('h:mm a').format(dateTo);
  }

  static DateTime getDateTimeFromDateAndMinutesString(
      DateTime date, String minutes) {
    var duration = Duration(minutes: int.parse(minutes));
    var dateToReturn = DateTime(date.year, date.month, date.day);
    dateToReturn = dateToReturn.add(duration);
    return dateToReturn;
  }

  static double getWeightPercentage(int? weight) {
    weight ??= 0;
    var percentage = weight / AppConstants.topWeight;
    return percentage > 1 ? 1 : percentage;
  }

  static double getPowerPercentage(int? hp) {
    hp ??= 0;
    var percentage = hp / AppConstants.topHorsePower;
    return percentage > 1 ? 1 : percentage;
  }

  static double getCityMilagePercentage(double? cityMilage) {
    cityMilage ??= 0;
    var percentage = cityMilage / AppConstants.topCityMilage;
    return percentage > 1 ? 1 : percentage;
  }

  static double getPricePercentage(double? price) {
    price ??= 0;
    var percentage = price / AppConstants.topPrice;
    return percentage > 1 ? 1 : percentage;
  }

  static void share(Uint8List? bytes) async {
    final file = File(
        '${(await getTemporaryDirectory()).path}/${DateTime.now().toIso8601String().replaceAll('.', '-')}.png');
    await file.create(recursive: true);
    File path = await file.writeAsBytes(bytes!);
    await Share.shareFiles([path.path],
        text: 'Check it out in Wroom App\n\n${AppConstants.appLink}');
  }
}
