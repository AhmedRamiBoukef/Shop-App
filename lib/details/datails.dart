import 'package:flutter/material.dart';
import 'package:shop_app/details/widgets/colorpoint.dart';

class DetailScreen extends StatelessWidget {
  static const String screenRoute = "/DetailScreen";
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
        child: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.favorite,
            size: 30,
            color: Colors.red,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
              child: Image.asset(
                height: 132,
                "assets/images/product_0.png",
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Long Sleeve Shirts",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "\$" + 165.toString(),
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        "A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.",
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Colors",
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        ColorPoint(
                          color: Color(0xFFBEE8EA),
                          isSelected: false,
                        ),
                        ColorPoint(
                          color: Color(0xFF141B4A),
                          isSelected: true,
                        ),
                        ColorPoint(
                          color: Color(0xFFF4E5C3),
                          isSelected: false,
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Center(
                      child: SizedBox(
                        width: 200,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: Colors.orange,
                              shape: const StadiumBorder()),
                          child: const Text("Add to Cart"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}