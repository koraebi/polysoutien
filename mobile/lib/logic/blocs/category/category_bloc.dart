import 'dart:convert';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:mobile/logic/models/category.dart';
import 'package:stream_transform/stream_transform.dart';

part 'category_event.dart';
part 'category_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(const CategoryState()) {
    on<CategoryFetched>(
      _onCategoryFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  Future<void> _onCategoryFetched(
      CategoryFetched event, Emitter<CategoryState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == CategoryStatus.initial) {
        final categories = await _fetchCategory();
        return emit(state.copyWith(
          status: CategoryStatus.success,
          categories: categories,
          hasReachedMax: true,
        ));
      }
    } catch (e) {
      emit(state.copyWith(status: CategoryStatus.failure));
    }
  }

  Future<List<Category>> _fetchCategory([int startIndex = 0]) async {
    final response = await rootBundle.loadString('assets/data/categories.json');
    if (response.isNotEmpty) {
      final body = json.decode(response) as List;
      return body.map((dynamic json) {
        return Category(
            name: json['name'] as String, picture: json['picture'] as String);
      }).toList();
    }
    throw Exception('error fetching categories');
  }
}
