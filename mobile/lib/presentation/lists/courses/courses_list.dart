import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/logic/blocs/course/course_bloc.dart';
import 'package:mobile/presentation/widgets/bottom_loader.dart';
import 'package:mobile/presentation/lists/courses/course_list_item.dart';

class CoursesList extends StatefulWidget {
  @override
  _CoursesListState createState() => _CoursesListState();
}

class _CoursesListState extends State<CoursesList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseBloc, CourseState>(
      builder: (context, state) {
        switch (state.status) {
          case CourseStatus.failure:
            return const Center(child: Text('failed to fetch courses'));
          case CourseStatus.success:
            if (state.courses.isEmpty) {
              return const Center(child: Text('no courses'));
            }
            return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return index >= state.courses.length
                      ? BottomLoader()
                      : CourseListItem(course: state.courses[index]);
                },
                itemCount: state.hasReachedMax
                    ? state.courses.length
                    : state.courses.length + 1,
                controller: _scrollController);
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<CourseBloc>().add(CourseFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
