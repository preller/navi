import 'dart:async';
import 'package:navi/blocs/bloc_provider.dart';
import 'package:navi/models/room_model.dart';
import 'package:navi/api/fake_DB_api.dart';

class RoomsBloc implements BlocBase{
  Rooms _rooms;
  //String _qrResult;

  // Streams to handle rooms data
  StreamController<Rooms> _roomsController = StreamController<Rooms>.broadcast();
  Sink<Rooms> get inAvailableRoom => _roomsController.sink;
  Stream<Rooms> get outAavailableRoom => _roomsController.stream;

  // Streams to handle qrcode data
  //StreamController<String> _qrCodeController = StreamController<String>.broadcast();
  //Sink<String> get inQrCode => _qrCodeController.sink;
  //Stream<String> get outQrCode => _qrCodeController.stream;

  // Streams to handle the increment of the counter
  StreamController<Rooms> _selectRoomController = StreamController<Rooms>.broadcast();
  Sink<Rooms> get selectRoom => _selectRoomController.sink;

  RoomsBloc(){
    api.getRoom().then((rooms){
      _rooms = rooms;
      inAvailableRoom.add(_rooms);
    });
    _selectRoomController.stream.listen((_){
      _roomsController.sink.add(_rooms);
    });
  }

  @override
  void dispose() {  // dispose stream when we are done to avoid leaks
    _roomsController.close();
    _selectRoomController.close();
    //_qrCodeController.close();
  }

  void _select(data){ // select room add the room object to the stream
    //_room.room = (_roomNumbers..shuffle()).first;
    inAvailableRoom.add(_rooms);
  }
}

