part of 'course_bloc.dart';

abstract class CourseEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CourseFetched extends CourseEvent {}

class CourseTouched extends CourseEvent {}
