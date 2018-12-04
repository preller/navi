import 'dart:convert';

class DatabaseManager {
  // TODO - Get the real JSON object from Firebase
  static final String jsonString = '''
  {
  "events": {
    "printing":{},
    "eating":{}
  },
  "type": {
    "classroom":{},
    "office":{},
    "lab": {}
  },
	"rooms":{
		"a103": {
			"qr": "XXX"
		},
		"a104": {
			"qr": "XXX"
		},
		"a108": {
			"qr": "XXX"
		},
		"a109": {
			"qr": "XXX"
		},
		"a203": {
			"qr": "XXX"
		},
		"a204": {
			"qr": "XXX"
		},
		"a206": {
			"qr": "XXX"
		},
		"a207": {
			"qr": "XXX"
		},
		"a304": {
			"qr": "XXX"
		}
	},
	"buildings":{
		"A": {
			"campus": "Prittwitzstraße"
		},
		"B": {
			"campus": "Prittwitzstraße"
		},
		"C": {
			"campus": "Prittwitzstraße"
		},
		"D": {
			"campus": "Prittwitzstraße"
		},
		"E": {
			"campus": "Prittwitzstraße"
		},
		"F": {
			"campus": "Prittwitzstraße"
		},
		"G": {
			"campus": "Prittwitzstraße"
		},
		"H": {
			"campus": "Prittwitzstraße"
		},
		"K": {
			"campus": "Prittwitzstraße"
		},
		"L": {
			"campus": "Prittwitzstraße"
		},
		"U": {
			"campus": "Prittwitzstraße"
		},
		"M": {
			"campus": "Böfingen"
		},
		"N": {
			"campus": "Böfingen"
		},
		"O": {
			"campus": "Böfingen"
		},
		"P": {
			"campus": "Böfingen"
		},
		"Z": {
			"campus": "Böfingen"
		},
		"Q": {
			"campus": "Eselsberg"
		},
		"V": {
			"campus": "Eselsberg"
		},
		"R": {
			"campus": "Eselsberg"
		},
		"S": {
			"campus": "Eselsberg"
		},
		"T": {
			"campus": "Eselsberg"
		}
	},
	"hochschule" : {
		"A": {
			"a103": "XXX",
			"a104": "XXX",
			"a108": "XXX",
			"a109": "XXX",
			"a203": "XXX",
			"a204": "XXX",
			"a206": "XXX",
			"a207": "XXX",
			"a304": "XXX"
		}
	},
	"eventParticipants":{},
	"typeAssignment":{
	  "classroom":{
	    "a103": "XXX",
			"a104": "XXX",
			"a108": "XXX",
			"a109": "XXX",
			"a203": "XXX",
			"a204": "XXX",
			"a206": "XXX",
			"a207": "XXX",
			"a304": "XXX"
	  }
	}
}
  ''';

  // Map of the JSON string
  static Map data = jsonDecode(jsonString);

  /// Gets anchor point for a specific room.
  /// @param roomNumber - The queried room number
  /// @return The anchor point for the given room
  static String getAnchorID(final String roomNumber) {
    return data["rooms"][roomNumber]["qr"];
  }
}

/// Testing the function
void main() {
  String roomNumber = "a103";
  print(DatabaseManager.getAnchorID(roomNumber));
}
