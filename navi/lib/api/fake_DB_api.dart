import 'package:navi/models/room_model.dart';

// db to simulate getting data from external source
// data for dropdown is loaded, 500ms delay to make it feel data is coming from
// external source
class DbApi{
  Future<Rooms> getRoom() async {
    await Future.delayed(Duration(milliseconds: 500));
    Rooms _rooms = Rooms(
      'A112',
      '',
      ['A108', 'A109', 'B114', 'B108']);
    return _rooms;
  }
}

DbApi api = DbApi();