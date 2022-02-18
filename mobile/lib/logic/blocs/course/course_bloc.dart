import 'dart:convert';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:mobile/logic/models/availability.dart';
import 'package:mobile/logic/models/course.dart';
import 'package:stream_transform/stream_transform.dart';

part 'course_event.dart';
part 'course_state.dart';

const _courseLimit = 10;
const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseBloc() : super(const CourseState()) {
    on<CourseFetched>(
      _onCourseFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  Future<void> _onCourseFetched(
      CourseFetched event, Emitter<CourseState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == CourseStatus.initial) {
        final courses = await _fetchCourses();
        return emit(state.copyWith(
          status: CourseStatus.success,
          courses: courses,
          hasReachedMax: true,
        ));
      }
    } catch (e) {
      emit(state.copyWith(status: CourseStatus.failure));
    }
  }

  Future<List<Course>> _fetchCourses([int startIndex = 0]) async {
    final response = await rootBundle.loadString('assets/data/courses.json');
    if (response.isNotEmpty) {
      final body = json.decode(response) as List;
      return body.map((dynamic json) {
        return Course(
          name: json['name'] as String,
          picture: json['picture'] as String,
          level: json['level'] as String,
          tags: List<String>.from(json['tags']),
          author: json['author'] as String,
          category: json['category'] as String,
          rate: (json['rate'] as num).toDouble(),
          rates: (json['rates'] as num).toDouble(),
          availabilities: (json['availabilities'] as List)
              .map((i) => Availability.fromJson(i))
              .toList(),
        );
      }).toList();
    }
    throw Exception('error fetching courses');
  }
}
