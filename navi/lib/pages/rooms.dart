import 'package:flutter/material.dart';
import 'package:navi/blocs/bloc_provider.dart';
import 'package:navi/blocs/room_bloc.dart';
import 'package:navi/models/room_model.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';

class RoomsPage extends StatefulWidget {
  RoomsPage({Key key}) : super(key: key);

  @override
  _RoomsPageState createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {
  String _value;
  Rooms _rooms;
  String _qrResult = '';
  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
        _qrResult = qrResult;
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        _qrResult = "Camera not permission was denied";
      } else {
        _qrResult = "Unknown Error $ex";
      }
    } on FormatException {
      _qrResult = "You pressed the back button before scanning anything";
    } catch (ex) {
      _qrResult = "Unknown Error $ex";
    }
  }

  @override
  Widget build(BuildContext context) {
    final RoomsBloc _roomsBloc = BlocProvider.of<RoomsBloc>(context);
    final RoomsBloc _qrCodeBloc = BlocProvider.of<RoomsBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Rooms'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Text('Get room numbers by tapping button'),
            StreamBuilder<Rooms>(
            // We are listening to a stream, when a value goes out the stream
            // we update the room on the dropdown picker
              stream: _roomsBloc.outAavailableRoom,
              initialData: Rooms.empty(),
              builder: (BuildContext context, AsyncSnapshot<Rooms> snapshot){
                if (snapshot.hasData) {
                  _rooms = Rooms(_value, snapshot.data.rooms);
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
            StreamBuilder<String>(
              stream: _qrCodeBloc.outQrCode,
              initialData: '',
              builder: (BuildContext context, AsyncSnapshot<String> snapshot){
                if(snapshot.hasData) {
                  return Text(_qrResult);
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
          print(_rooms.room);
          _scanQR();
          _qrCodeBloc.inQrCode.add(_qrResult);
          print(_qrResult);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
