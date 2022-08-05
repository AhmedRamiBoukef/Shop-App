import 'package:flutter/material.dart';
import 'package:shop_app/data/data.dart';
import 'package:shop_app/models/Product.dart';

class CartScreen extends StatefulWidget {
  static const screenRoute = "/myCart";
  CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late List<Product> products;
  late List<int> total;
  late int totalprice = 0;
  @override
  void initState() {
    products = mycart.map((e) => demo_product[e]).toList();

    total = products.map((e) => e.price).toList();
    for (var i = 0; i < total.length; i++) {
      totalprice = totalprice + total[i];
    }
    print(totalprice);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Cart",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              child: Column(
                children: List.generate(
                  products.length,
                  (index) => CartElem(
                    bgColor: products[index].bgColor,
                    image: products[index].image,
                    price: products[index].price,
                    title: products[index].title,
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Subtotal :",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      "\$" + totalprice.toString(),
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Center(
                  child: SizedBox(
                    width: 200,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: Colors.orange, shape: const StadiumBorder()),
                      child: const Text("Checkout"),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CartElem extends StatelessWidget {
  final Color bgColor;
  final String title, image;
  final int price;
  const CartElem({
    required this.bgColor,
    required this.image,
    required this.price,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Image.asset(
                height: 132,
                image,
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        title,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "\$" + price.toString(),
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      ElementsButton(icon: Icons.remove),
                      Text(
                        "1",
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      ElementsButton(icon: Icons.add),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ElementsButton extends StatelessWidget {
  final IconData icon;
  const ElementsButton({
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 20,
          width: 30,
          decoration: BoxDecoration(
            color: Color.fromARGB(55, 255, 153, 0),
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          child: Icon(
            icon,
            size: 20,
            color: Colors.orange,
          ),
        ),
      ),
    );
  }
}
