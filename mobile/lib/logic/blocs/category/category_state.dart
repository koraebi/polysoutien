part of 'category_bloc.dart';

enum CategoryStatus { initial, success, failure }

class CategoryState extends Equatable {
  const CategoryState({
    this.status = CategoryStatus.initial,
    this.categories = const <Category>[],
    this.hasReachedMax = false,
  });

  final CategoryStatus status;
  final List<Category> categories;
  final bool hasReachedMax;

  CategoryState copyWith({
    CategoryStatus? status,
    List<Category>? categories,
    bool? hasReachedMax,
  }) {
    return CategoryState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''CategoryState { status: $status, hasReachedMax: $hasReachedMax, categories: ${categories.length} }''';
  }

  @override
  List<Object> get props => [status, categories, hasReachedMax];
}
