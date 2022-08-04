import 'package:flutter/material.dart';
import 'package:shop_app/details/datails.dart';

import '../../models/Product.dart';
import 'productcard.dart';

class NewArrivals extends StatelessWidget {
  const NewArrivals({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "New Arrivel",
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "See All",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          child: Row(
            children: List.generate(
              demo_product.length,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: ProductCard(
                  title: demo_product[index].title,
                  image: demo_product[index].image,
                  price: demo_product[index].price,
                  bgColor: demo_product[index].bgColor,
                  press: () {
                    Navigator.of(context).pushNamed(
                      DetailScreen.screenRoute,
                      arguments: {
                        'title': demo_product[index].title,
                        'image': demo_product[index].image,
                        'price': demo_product[index].price,
                        'bgColor': demo_product[index].bgColor,
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
