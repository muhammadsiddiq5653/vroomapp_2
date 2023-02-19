import 'dart:io';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_launcher_icons/utils.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as imagelib;
import 'package:path_provider/path_provider.dart';
import 'package:vroom_app/app/data/api/app_cars_api.dart';
import 'package:vroom_app/app/modules/app_abstract_controller.dart';

enum CameraStates {
  cameraStarting,
  cameraStarted,
  cameraError,
  cameraScanning,
  cameraDone
}

class ScanCarController extends AppAbstractController {
  var cameras = <CameraDescription>[];
  CameraController? cameraController;
  AppCarsApi appCarsApi = Get.put(AppCarsApi());
  bool cameraReady = false;
  CameraStates cameraStates = CameraStates.cameraStarting;
  Image? licenceImageCropped;
  String? errorMessage;
  XFile? licenceImage;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    loadCameras();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void loadCameras() async {
    cameras = await availableCameras();
    cameraController = CameraController(cameras[0], ResolutionPreset.max);
    cameraController!.initialize().then((_) {
      cameraStates = CameraStates.cameraStarted;
      update();
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  void findCar() async {
    try {
      var path = await _takePicture();
      if (path == null)
        throw Exception(
            'we had issues with scanning this car, please try again');
      var car = await appCarsApi.vroomCar(path.path);
      settingsService.cars.add(car);
      cameraStates = CameraStates.cameraDone;
      Get.back();
    } catch (e, ex) {
      print(e);
      errorMessage = e.toString();
      cameraStates = CameraStates.cameraError;
      print(ex);
    } finally {
      update();
    }
  }

  Future<File?> _takePicture() async {
    try {
      errorMessage = null;
      licenceImage = await cameraController!.takePicture();
      cameraStates = CameraStates.cameraScanning;
      print('sss');
      update();

      Directory tempDir = await getTemporaryDirectory();
      print('galo');
      String tempPath = tempDir.path;
      var result = await compute<List, File>(
          _resizeImage, [File(licenceImage!.path), tempPath]);
      print(result);
      return result;
    } catch (ex) {
      print(ex);
      cameraStates = CameraStates.cameraError;
      return null;
    } finally {
      update();
    }
  }

  Future<imagelib.Image?> cropImage(licenceImage) async {
    var image = decodeImageFile(licenceImage!.path);
    if (image == null) return null;
    return imagelib.copyCrop(image, 0, 0, image.width, image.height);
  }

  void retry() {
    cameraStates = CameraStates.cameraStarted;
    update();
  }

  static Future<File> _resizeImage(List list) async {
    var file = list[0] as File;
    var tempPath = list[1] as String;
    print('hellooooo');
    final bytes = await file.readAsBytes();
    final imagelib.Image? image = imagelib.decodeImage(bytes);
    final imagelib.Image? resized = imagelib.copyResize(image!, width: 800);
    final List<int> resizedBytes = imagelib.encodeJpg(resized!, quality: 90);
    print('balooo');
    var path = await File('$tempPath/scan.png').writeAsBytes(resizedBytes);
    print(path);
    return path;
  }
}
