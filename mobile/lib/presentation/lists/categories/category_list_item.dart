import 'package:flutter/material.dart';
import 'package:mobile/logic/models/category.dart';

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({Key? key, required this.category}) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(20)),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Column(children: [
              Image.asset(category.picture),
              const SizedBox(height: 10),
              Text(category.name,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold))
            ])));
  }
}
