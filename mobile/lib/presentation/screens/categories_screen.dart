import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/logic/blocs/category/category_bloc.dart';
import 'package:mobile/presentation/lists/categories/categories_list.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: BlocProvider(
          create: (_) => CategoryBloc()..add(CategoryFetched()),
          child: CategoriesList(),
        ));
  }
}
