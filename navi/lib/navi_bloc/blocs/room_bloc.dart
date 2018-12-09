import 'dart:async';
import 'package:navi/navi_bloc/blocs/bloc_provider.dart';
import 'package:navi/navi_bloc/models/room_model.dart';
import 'package:navi/navi_bloc/api/fake_DB_api.dart';

class RoomsBloc implements BlocBase{
  Rooms _room;

  // sample data
  List<String> _roomNumbers = ['A108', "B109", "B104", "A100", "C108", "F112"];
  List<String> _campus = [
    "Campus Pritwitzstrasse",
    "Campus Bofigen",
    "Campus Eselsberg"
  ];

  // Streams to handle the counter
  StreamController<Rooms> _roomsController = StreamController<Rooms>();
  Sink<Rooms> get _inAvailableRoom => _roomsController.sink;
  Stream<Rooms> get outAavailableRoom => _roomsController.stream;

  // Streams to handle the increment of the counter
  StreamController<Rooms> _selectRoomController = StreamController<Rooms>();
  Sink<Rooms> get selectRoom => _selectRoomController.sink;

  RoomsBloc(){
    api.getRoom().then((room){
      _room = room;
      _inAvailableRoom.add(_room);
    });
    _selectRoomController.stream.listen(_select);
  }

  @override
  void dispose() {  // dispose stream when we are done to avoid leaks
    _roomsController.close();
    _selectRoomController.close();
  }

  void _select(data){ // select room add the room object to the stream
    _room.room = (_roomNumbers..shuffle()).first;
    _inAvailableRoom.add(_room);
  }
}

