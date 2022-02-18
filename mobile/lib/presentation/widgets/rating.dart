import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  const Rating({Key? key, required this.rate, required this.rates})
      : super(key: key);

  final double rate;
  final double rates;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: generateStars(rate, rates),
    );
  }
}

List<Widget> generateStars(double rate, double rates) {
  List<Widget> stars = [];

  for (var i = 0; i < rate.floor(); i++) {
    stars.add(const Icon(Icons.star, color: Colors.orange, size: 15));
  }

  if (rate > rate.floor()) {
    stars.add(const Icon(Icons.star_half, color: Colors.orange, size: 15));
  }

  for (var i = rate.ceil(); i < 5; i++) {
    stars.add(const Icon(Icons.star, color: Colors.grey, size: 15));
  }

  return stars;
}
