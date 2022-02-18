import 'package:equatable/equatable.dart';

class Session extends Equatable {
  const Session(
      {required this.name,
      required this.author,
      required this.dateTime,
      required this.room,
      required this.picture});

  final String name;
  final String author;
  final String room;
  final String picture;
  final DateTime dateTime;

  @override
  List<Object> get props => [name, author, dateTime, room, picture];
}
