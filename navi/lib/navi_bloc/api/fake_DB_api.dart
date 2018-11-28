import 'package:navi/navi_bloc/models/room_model.dart';

// db to simulate getting data from external source the first room before button
// press is loaded from here
class DbApi{
  Future<Rooms> getRoom() async {
    await Future.delayed(Duration(seconds: 1));
    Rooms _room = Rooms('A112', 'Campus Bofigen');
    return _room;
  }
}

DbApi api = DbApi();