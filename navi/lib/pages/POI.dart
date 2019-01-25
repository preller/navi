import 'package:flutter/material.dart';
import 'package:navi/blocs/room_bloc.dart';
import 'package:navi/blocs/pathFinders/Pathfinder.dart';
import 'package:navi/services/localization.dart';

class PoiPage extends StatefulWidget {
  RoomsBloc bloc;

  PoiPage({
    Key key,
    this.bloc
  }) : super(key: key);

  @override
  PoiPageState createState() {
    return new PoiPageState();
  }
}

class PoiPageState extends State<PoiPage> {

  List<String> _pathInstructions = [];

  int stepCounter = 0;

  List<Step> steps;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('POI'),
      ),
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Builder(builder: (BuildContext context) {
            _pathInstructions =
              Pathfinder.findPath('test1', 'test2');
            print(_pathInstructions.length);
            steps = new List<Step>.generate(_pathInstructions.length, (int index) {
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
              });
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
          })
      ]
    ),
    )
    );
  }
}
