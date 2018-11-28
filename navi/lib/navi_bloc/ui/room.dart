import 'package:flutter/material.dart';
import 'package:navi/navi_bloc/blocs/bloc_provider.dart';
import 'package:navi/navi_bloc/blocs/room_bloc.dart';
import 'package:navi/navi_bloc/models/room_model.dart';

class RoomsPage extends StatefulWidget {
  RoomsPage({Key key}) : super(key: key);

  @override
  _RoomsPageState createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {
  @override
  Widget build(BuildContext context) {
    final RoomsBloc selectRoom = BlocProvider.of<RoomsBloc>(context);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Navi'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: 'Room'),
              Tab(text: 'POI'),
              Tab(text: 'History')
            ],
          ),
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
      )
    );
  }
}
