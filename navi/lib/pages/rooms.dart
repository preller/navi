import 'package:flutter/material.dart';
import 'package:navi/blocs/bloc_provider.dart';
import 'package:navi/blocs/room_bloc.dart';
import 'package:navi/models/room_model.dart';
import 'package:navi/blocs/pathFinders/Pathfinder.dart';
import 'package:navi/services/localization.dart';

class RoomsPage extends StatefulWidget {
  RoomsPage({Key key}) : super(key: key);

  @override
  _RoomsPageState createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {
  String _value;
  RoomsBloc _roomsBloc;
  Rooms _rooms;
  List<String> _pathInstructions = [];
  int stepCounter = 0;
  List<Step> steps;

  @override
  Widget build(BuildContext context) {
    _roomsBloc = BlocProvider.of<RoomsBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).findRoomText),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            StreamBuilder<Rooms>(
              // We are listening to a stream, when a value goes out the stream
              // we update the room on the dropdown picker
              stream: _roomsBloc.outRoom,
              initialData: Rooms.empty(),
              builder: (BuildContext context, AsyncSnapshot<Rooms> snapshot) {
                if (snapshot.hasData) {
                  _rooms = Rooms(_value, _roomsBloc.qrResult, snapshot.data.rooms);
                  return DropdownButton(
                    value: _value,
                    hint: Text(AppLocalizations.of(context).dropDownRoomText),
                    items: snapshot.data.rooms.map((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text('${value}',),
                      );
                    }).toList(),
                    onChanged: (String value) {
                      _value = value;
                      _roomsBloc.inRoom.add(_rooms); //equivalent to setState(() {});
                    },
                  );
                }
                return DropdownButton(
                  items: null, onChanged: (String value) {});
              },
            ),
            StreamBuilder<Rooms>(
              stream: _roomsBloc.outRoom,
              initialData: Rooms.empty(),
              builder: (BuildContext context, AsyncSnapshot<Rooms> snapshot) {
                _roomsBloc.inRoom.add(_rooms);
                if(snapshot.hasData) {
                  if (_rooms.qrCode.length > 0) {
                    _pathInstructions =
                      Pathfinder.findPath(_rooms.qrCode, _rooms.room);
                    print(_pathInstructions.length);

                    steps = new List<Step>.generate(
                      _pathInstructions.length, (int index) {
                      if (index == 0) {
                        return Step(
                          title: Text("Start"),
                          content: Text(
                            _pathInstructions.elementAt(index).toUpperCase(),
                            style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,),
                          isActive: true,
                        );
                      } else if (index == _pathInstructions.length - 1) {
                        return Step(
                          title: Text(AppLocalizations.of(context).finishText),
                          content: Text(
                            _pathInstructions.elementAt(index).toUpperCase(),
                            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold), textAlign: TextAlign.left,),
                          isActive: true,
                        );
                      } else {
                        return Step(
                          title: Text(""),
                          content: Text(
                            _pathInstructions.elementAt(index).toUpperCase(),
                            style: TextStyle(fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,),
                          isActive: true,
                        );
                      }
                    }
                    );
                    return Stepper(
                      currentStep: this.stepCounter,
                      steps: steps,
                      type: StepperType.vertical,
                      onStepTapped: (step) {
                        setState(() {
                          stepCounter = step;
                        });
                      },
                      /// controlsBuilder to override defaults of OnStepContinue
                      /// and onStepCancel, so we can edit the buttons and
                      /// provide various behaviours on press
                      controlsBuilder: (
                        BuildContext context,
                        {VoidCallback onStepContinue, VoidCallback onStepCancel}
                        ) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0)),
                              FlatButton(
                                child: Text(AppLocalizations.of(context).backText, style: TextStyle(color: Colors.white, fontSize: 13.0)),
                                onPressed: () {
                                  setState(() {
                                    stepCounter > 0 ? stepCounter -= 1 : stepCounter = 0;
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0)
                                ),
                                color: Colors.grey,
                              ),
                              SizedBox(width: 10),
                              FlatButton(
                                child: Text(AppLocalizations.of(context).nextText, style: TextStyle(color: Colors.white, fontSize: 13.0),
                                ),
                                onPressed: () {
                                  setState(() {
                                    stepCounter < steps.length - 1
                                      ? stepCounter += 1
                                      : stepCounter = 0;
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0)
                                ),
                                color: Colors.blue,
                              ),
                            ]
                          );
                      },
                    );
                  }
                }
                return Text('');
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
            _roomsBloc.scanQR();
          } catch (err) {
            print(err);
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

