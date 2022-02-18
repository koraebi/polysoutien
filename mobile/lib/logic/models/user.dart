import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';
import 'session.dart';

class User extends Equatable {
  User({
    required this.name,
    required this.sessions,
    required this.level,
    required this.categories,
  });

  final String name;
  final List<Session> sessions;
  final List<String> categories;
  final String level;
  LatLng position = LatLng(0, 0);

  @override
  List<Object> get props => [name, sessions, level, position, categories];
}
