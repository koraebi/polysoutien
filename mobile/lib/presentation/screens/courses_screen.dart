import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/logic/blocs/course/course_bloc.dart';
import 'package:mobile/presentation/lists/courses/courses_list.dart';

class CoursesScreen extends StatefulWidget {
  @override
  _CoursesScreenState createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: BlocProvider(
          create: (_) => CourseBloc()..add(CourseFetched()),
          child: CoursesList(),
        ));
  }
}
