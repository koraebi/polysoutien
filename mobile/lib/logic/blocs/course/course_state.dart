part of 'course_bloc.dart';

enum CourseStatus { initial, success, failure }

class CourseState extends Equatable {
  const CourseState({
    this.status = CourseStatus.initial,
    this.courses = const <Course>[],
    this.hasReachedMax = false,
  });

  final CourseStatus status;
  final List<Course> courses;
  final bool hasReachedMax;

  CourseState copyWith({
    CourseStatus? status,
    List<Course>? courses,
    bool? hasReachedMax,
  }) {
    return CourseState(
      status: status ?? this.status,
      courses: courses ?? this.courses,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''CourseState { status: $status, hasReachedMax: $hasReachedMax, courses: ${courses.length} }''';
  }

  @override
  List<Object> get props => [status, courses, hasReachedMax];
}
