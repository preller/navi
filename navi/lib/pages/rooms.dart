import 'package:flutter/material.dart';
import 'package:navi/blocs/bloc_provider.dart';
import 'package:navi/blocs/room_bloc.dart';
import 'package:navi/models/room_model.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:navi/support/Pathfinder.dart';

class RoomsPage extends StatefulWidget {
  RoomsPage({Key key}) : super(key: key);

  @override
  _RoomsPageState createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {
  String _value;
  Rooms _rooms;
  String _qrResult = '';
  List<String> _pathInstructions;
  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
        _qrResult = qrResult;
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

  @override
  Widget build(BuildContext context) {
    final RoomsBloc _roomsBloc = BlocProvider.of<RoomsBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Rooms'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //Text('Get room numbers by tapping button'),
            StreamBuilder<Rooms>(
            // We are listening to a stream, when a value goes out the stream
            // we update the room on the dropdown picker
              stream: _roomsBloc.outAavailableRoom,
              initialData: Rooms.empty(),
              builder: (BuildContext context, AsyncSnapshot<Rooms> snapshot){
                if (snapshot.hasData) {
                  _rooms = Rooms(_value, _qrResult, snapshot.data.rooms);
                  return DropdownButton(
                    value: _value,
                    hint: Text('Select Room'),
                    items: snapshot.data.rooms.map((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text('${value}',),
                      );
                    }).toList(),
                    onChanged: (String value) {
                      _value = value;
                      _roomsBloc.inAvailableRoom.add(_rooms); //equivalent setState(() {});
                    },
                  );
                }
                return DropdownButton(items: null, onChanged: (String value){});
              },
            ),
            StreamBuilder<Rooms>(
              stream: _roomsBloc.outAavailableRoom,
              initialData: Rooms.empty(),
              builder: (BuildContext context, AsyncSnapshot<Rooms> snapshot){
                _roomsBloc.inAvailableRoom.add(_rooms);
                if(snapshot.hasData) {
                  if (_rooms.qrCode.length > 0) {
                    _pathInstructions = Pathfinder.findPath(_rooms.qrCode, _rooms.room);
                    return Text('${_pathInstructions.elementAt(0)} then '
                      '${_pathInstructions.elementAt(1)}');
                  }
                  return Text('');
                }
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.camera_alt),
        label: Text("Scan"),
        onPressed: () {
          try {
            _scanQR();
          } catch (err) {
            print(err);
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
