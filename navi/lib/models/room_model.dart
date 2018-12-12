class Rooms {
  String room;
  List<String> rooms;
  Rooms.empty() {
    this.room = '';
    this.rooms = [''];
  }
  Rooms(this.room, this.rooms);
}