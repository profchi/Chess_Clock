class TimeDisplay {
  static String incrementConverter(double increment) {
    return increment < 10 ? "0$increment" : "$increment";
  }

  static String timeConverter(double currentTime) {
    int currentMin = currentTime ~/ 60;
    String currentMinText = currentMin < 10 ? "0$currentMin" : "$currentMin";

    int currentSec = (currentTime % 60).toInt();
    String currentSecText = currentSec < 10 ? "0$currentSec" : "$currentSec";

    return currentMinText + ":" + currentSecText;
  }
}