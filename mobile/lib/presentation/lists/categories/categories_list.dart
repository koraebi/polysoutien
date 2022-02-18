import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/logic/blocs/category/category_bloc.dart';
import 'package:mobile/presentation/widgets/bottom_loader.dart';

import 'category_list_item.dart';

class CategoriesList extends StatefulWidget {
  @override
  _CategoriesListState createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        switch (state.status) {
          case CategoryStatus.failure:
            return const Center(child: Text('failed to fetch categories'));
          case CategoryStatus.success:
            if (state.categories.isEmpty) {
              return const Center(child: Text('no categories'));
            }
            return GridView.builder(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 1.05,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 30),
              itemBuilder: (BuildContext context, int index) {
                return index >= state.categories.length
                    ? BottomLoader()
                    : CategoryListItem(category: state.categories[index]);
              },
              itemCount: state.hasReachedMax
                  ? state.categories.length
                  : state.categories.length + 1,
              controller: _scrollController,
            );
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
    if (_isBottom) context.read<CategoryBloc>().add(CategoryFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
