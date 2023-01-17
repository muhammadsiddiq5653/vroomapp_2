import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:map_launcher/map_launcher.dart';

import '../widgets/app_bottom_sheet.dart';
import '../widgets/app_list_tile.dart';

class MapLauncherService extends GetxService {
  void naviagte(double lat, double long, {title}) async {
    final coords = Coords(lat, long);
    final availableMaps = await MapLauncher.installedMaps;
    await Get.bottomSheet(AppBottomSheet(
        child: Wrap(
      children: [
        Container(
          child: ListView.builder(
              itemCount: availableMaps.length,
              shrinkWrap: true,
              itemBuilder: (_, index) {
                var map = availableMaps[index];
                return GestureDetector(
                  onTap: () {
                    map.showMarker(
                      coords: coords,
                      title: title ?? 'Uprise',
                    );
                  },
                  child: AppListTile(
                    title: Text(map.mapName),
                    leading: SvgPicture.asset(
                      map.icon,
                      height: 30.0,
                      width: 30.0,
                    ),
                    trailing: Container(),
                  ),
                );
              }),
        )
      ],
    )));
  }
}
