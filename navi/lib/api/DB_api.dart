import 'package:navi/models/room_model.dart';
import 'package:navi/data/data_manager.dart';


// for calling data from external source using the data manager endpoints
class DbApi {
  Future<Rooms> getRoom() async {
    List<String> buildingsList = await DataManager.getBuildings();
    List<String> roomsList = await DataManager.getRoomsForBuilding(buildingsList.elementAt(0));
    Rooms _rooms = Rooms(
      roomsList.elementAt(0),
      '',
      roomsList);
    return _rooms;
  }
}

DbApi api = DbApi();