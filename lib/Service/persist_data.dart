
import 'package:chess_clock/Common/classes/state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersistData {

  static const String playerOneCurrentTime = 'oneCurrent';
  static const String playerTwoCurrentTime = 'twoCurrent';
  static const String playerOneIncrement = 'oneIncrement';
  static const String playerTwoIncrement = 'twoIncrement';
  static PersistData _data;
  
  SharedPreferences preferences;
  
  _PersistData () {}

  static Future<PersistData> getInstance() async {
    if (_data == null) {
      _data = PersistData();
      _data.preferences = await SharedPreferences.getInstance();
    }
    return _data;
  }

  savePlayerOneState(AppState playerOne) {
    preferences.setDouble(playerOneCurrentTime, playerOne.defaultTime);
    preferences.setDouble(playerOneIncrement, playerOne.increments);
  }

  savePlayerTwoState(AppState playerTwo) {
    preferences.setDouble(playerTwoCurrentTime, playerTwo.defaultTime);
    preferences.setDouble(playerTwoIncrement, playerTwo.increments);
  }

  loadPlayerOneState() {
    AppState playerOne = new AppState(preferences.getDouble(playerOneCurrentTime) ?? 300, 
                                      preferences.getDouble(playerOneIncrement) ?? 0 );
    return playerOne;
  }

  loadPlayerTwoState() {
    AppState playerTwo = new AppState(preferences.getDouble(playerTwoCurrentTime) ?? 300, 
                                      preferences.getDouble(playerTwoIncrement) ?? 0 );
    return playerTwo;
  }
}