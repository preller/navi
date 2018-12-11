import 'package:flutter/material.dart';
import 'package:navi/drawer/sidedrawer.dart';
import 'package:navi/blocs/bloc_provider.dart';
import 'package:navi/blocs/room_bloc.dart';
import 'package:navi/models/room_model.dart';

class RoomsPage extends StatefulWidget {
  RoomsPage({Key key}) : super(key: key);

  @override
  _RoomsPageState createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {
  @override
  Widget build(BuildContext context) {
    final RoomsBloc selectRoom = BlocProvider.of<RoomsBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Rooms'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Get room numbers by tapping button'),
            StreamBuilder<Rooms>(
            // We are listening to a stream, when a value goes out the stream
            // we update the room as button is clicked
              stream: selectRoom.outAavailableRoom,
              initialData: Rooms.empty(),
              builder: (BuildContext context, AsyncSnapshot<Rooms> snapshot){
                return Text('${snapshot.data.room}', style: Theme.of(context).textTheme.display1,);
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          selectRoom.selectRoom.add(null);
        },
        tooltip: 'Select Room',
        child: const Icon(Icons.add),
      ),
    );
  }
}
