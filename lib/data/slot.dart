class Slot {

  final String startTime;
  final String endTime;
  final String eventName;
  final String roomNumber;
  final bool enrolled;
  final List<int> recurrenceDays; // List of integers representing days of the week (1 to 7).


  Slot( {
    required this.eventName,
    required this.startTime,
    required this.endTime,
    required this.roomNumber,
    required this.enrolled,
    required this.recurrenceDays
  });
}
