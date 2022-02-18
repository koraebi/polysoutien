import 'package:equatable/equatable.dart';

class Availability extends Equatable {
  const Availability({required this.time, required this.day});

  final String time;
  final String day;

  @override
  List<Object> get props => [time, day];

  factory Availability.fromJson(Map<String, dynamic> parsedJson) {
    return Availability(time: parsedJson['time'], day: parsedJson['day']);
  }
}
