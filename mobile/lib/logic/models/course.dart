import 'package:equatable/equatable.dart';
import 'package:mobile/logic/models/availability.dart';

class Course extends Equatable {
  const Course(
      {required this.name,
      required this.picture,
      required this.level,
      required this.tags,
      required this.category,
      required this.author,
      required this.rate,
      required this.rates,
      required this.availabilities});

  final String name;
  final String picture;
  final String level;
  final List<String> tags;
  final String category;
  final String author;
  final double rate;
  final double rates;
  final List<Availability> availabilities;

  @override
  List<Object> get props => [
        name,
        picture,
        level,
        tags,
        category,
        author,
        rate,
        rates,
        availabilities
      ];
}
