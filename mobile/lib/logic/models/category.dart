import 'package:equatable/equatable.dart';

class Category extends Equatable {
  const Category({required this.name, required this.picture});

  final String name;
  final String picture;

  @override
  List<Object> get props => [name, picture];
}
