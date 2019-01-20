class Rooms {
  String room;
  String qrCode;
  List<String> rooms;
  Rooms.empty() {
    this.room = '';
    this.qrCode = '';
    this.rooms = ['loading...'];
  }
  Rooms(this.room, this.qrCode, this.rooms);
}