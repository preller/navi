import 'dart:async';
import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';

import 'package:navi/blocs/bloc_provider.dart';
import 'package:navi/models/room_model.dart';
import 'package:navi/api/fake_DB_api.dart';
import 'package:navi/pages/rooms.dart';

class RoomsBloc implements BlocBase{
  Rooms _rooms;
  String qrResult = '';

  // Streams to handle rooms data
  StreamController<Rooms> _roomsController = StreamController<Rooms>.broadcast();
  Sink<Rooms> get inRoom => _roomsController.sink;
  Stream<Rooms> get outRoom => _roomsController.stream;

  // Streams to handle qrcode data
  StreamController<String> _qrCodeController = StreamController<String>.broadcast();
  Sink<String> get inQrCode => _qrCodeController.sink;
  Stream<String> get outQrCode => _qrCodeController.stream;

  // Streams to handle the increment of the counter
  StreamController<Rooms> _selectRoomController = StreamController<Rooms>.broadcast();
  Sink<Rooms> get selectRoom => _selectRoomController.sink;

  RoomsBloc(){
    api.getRoom().then((rooms){
      _rooms = rooms;
      inRoom.add(_rooms);
    });
    _selectRoomController.stream.listen((_){
      _roomsController.sink.add(_rooms);
    });
  }

  @override
  void dispose() {  // dispose stream when we are done to avoid leaks
    _roomsController.close();
    _selectRoomController.close();
    _qrCodeController.close();
  }

  // qr code scanner function, here since we are scanning for direction
  // to a room
  Future scanQR() async {
    try {
      String _qrResult = await BarcodeScanner.scan();
      qrResult = _qrResult;
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        print("Camera permission was denied");
      } else {
        print("Unknown Error $ex");
      }
    } on FormatException {
      print("You pressed the back button before scanning anything");
    } catch (ex) {
      throw("Unknown Error $ex");
    }
  }
}

