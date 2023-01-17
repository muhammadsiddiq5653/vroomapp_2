import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:vroom_app/app/data/models/car_model.dart';

const PLAECHOLDER = "placeholder";

class MatchMakingService extends GetxService {
  StreamSubscription<DatabaseEvent>? matchmakingSub;
  StreamSubscription<DatabaseEvent>? gmeInfoSub;

  @override
  void onInit() {
    super.onInit();
    FirebaseDatabase.instance.databaseURL =
        'https://vroom-4b229-default-rtdb.europe-west1.firebasedatabase.app/';
  }

  void joinQueue(
      {required int userID,
      required Function(Map?) callback,
      required CarModel car}) {
    print(FirebaseDatabase.instance.databaseURL);
    FirebaseDatabase.instance
        .ref("matchmaking/$userID")
        .set({"gameId": PLAECHOLDER, 'card': car.toJson()});

    matchmakingSub = FirebaseDatabase.instance
        .ref("matchmaking/$userID")
        .onValue
        .listen((event) async {
      var data = event.snapshot.value as Map?;
      if (data != null && data.containsKey("gameId")) {
        if (data['gameId'] == PLAECHOLDER) return;
        var gameId = data['gameId'];
        var ref = "games/$gameId";
        gmeInfoSub = FirebaseDatabase.instance.ref(ref).onValue.listen((event) {
          if (event.snapshot.exists) {
            callback(Map.from(event.snapshot.value as Map));
            closeQueueStream();
          }
        });
      }
    }, onError: (error) {
      print('Error from (MatchMakingService.joinQueue)');
      print(error);
    });
  }

  void closeQueueStream() {
    gmeInfoSub?.cancel();
    matchmakingSub?.cancel();
  }
}
