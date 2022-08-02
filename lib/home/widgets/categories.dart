import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/models/Category.dart';
import '../../models/Category.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 84,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, count) => CategoryCard(
          icon: demo_categories[count].icon,
          title: demo_categories[count].title,
          press: () {},
        ),
        separatorBuilder: (context, count) => SizedBox(width: 16),
        itemCount: demo_categories.length,
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String icon, title;
  final VoidCallback press;
  CategoryCard({
    required this.icon,
    required this.title,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: press,
      style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: Column(
          children: [
            SvgPicture.asset(icon),
            const SizedBox(height: 8),
            Text(
              title,
              style: Theme.of(context).textTheme.subtitle2,
            )
          ],
        ),
      ),
    );
  }
}
