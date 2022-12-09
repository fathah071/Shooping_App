import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/controller/home_screen_api_controller.dart';
import 'package:shopping_cart/controller/shared_preference_controller.dart';

import 'package:shopping_cart/view/Cart_page/cart_page.dart';

class ProductListingScreen extends StatelessWidget {
  ProductListingScreen({super.key, required this.categoryIndex});
  int categoryIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: const Text("Explore menu"),
      ),
      body: DefaultTabController(
        initialIndex: categoryIndex,
        length: 10,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            toolbarHeight: 10,
            bottom: TabBar(
              indicatorColor: Colors.red[900],
              labelColor: Colors.red[900],
              unselectedLabelColor: Colors.grey,
              labelStyle:
                  const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              isScrollable: true,
              tabs: const [
                Tab(
                  text: "SMOOTHIES",
                ),
                Tab(
                  text: "CAKES",
                ),
                Tab(
                  text: "FISH CURRY",
                ),
                Tab(
                  text: "SHAVARMA",
                ),
                Tab(
                  text: "BIRYANI",
                ),
                Tab(
                  text: "BREADS",
                ),
                Tab(
                  text: "ICE CREAMS",
                ),
                Tab(
                  text: "DRY FRUITS",
                ),
                Tab(
                  text: "BEVERAGES",
                ),
                Tab(
                  text: "DAILY SPECIALS",
                ),
              ],
            ),
          ),
          body: FutureBuilder(
              future: getHomeScreenData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final categoriesData = snapshot.data!.data.featuredProducts;
                  return TabBarView(
                    children: [
                      CategoriesWidget(
                        categoriesImage: categoriesData[4].image,
                        categoriesName: categoriesData[4].name,
                        categoriesPrice: categoriesData[4].price,
                      ),
                      CategoriesWidget(
                        categoriesImage: categoriesData[4].image,
                        categoriesName: categoriesData[4].name,
                        categoriesPrice: categoriesData[4].price,
                      ),
                      CategoriesWidget(
                        categoriesImage: categoriesData[4].image,
                        categoriesName: categoriesData[4].name,
                        categoriesPrice: categoriesData[4].price,
                      ),
                      CategoriesWidget(
                        categoriesImage: categoriesData[4].image,
                        categoriesName: categoriesData[4].name,
                        categoriesPrice: categoriesData[4].price,
                      ),
                      CategoriesWidget(
                        categoriesImage: categoriesData[4].image,
                        categoriesName: categoriesData[4].name,
                        categoriesPrice: categoriesData[4].price,
                      ),
                      CategoriesWidget(
                        categoriesImage: categoriesData[4].image,
                        categoriesName: categoriesData[4].name,
                        categoriesPrice: categoriesData[4].price,
                      ),
                      CategoriesWidget(
                        categoriesImage: categoriesData[3].image,
                        categoriesName: categoriesData[3].name,
                        categoriesPrice: categoriesData[3].price,
                      ),
                      CategoriesWidget(
                        categoriesImage: categoriesData[4].image,
                        categoriesName: categoriesData[4].name,
                        categoriesPrice: categoriesData[4].price,
                      ),
                      CategoriesWidget(
                        categoriesImage: categoriesData[0].image,
                        categoriesName: categoriesData[0].name,
                        categoriesPrice: categoriesData[0].price,
                      ),
                      CategoriesWidget(
                        categoriesImage: categoriesData[4].image,
                        categoriesName: categoriesData[4].name,
                        categoriesPrice: categoriesData[4].price,
                      ),
                    ],
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.shopping_bag_outlined,color: Colors.white,),
            backgroundColor: Colors.red[900],
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Cart_page()),
              );
            },
          ),
        ),
      ),
    );
  }
}

class CategoriesWidget extends StatefulWidget {
  CategoriesWidget({
    super.key,
    required this.categoriesImage,
    required this.categoriesName,
    required this.categoriesPrice,
  });
  String categoriesImage;
  String categoriesName;
  String categoriesPrice;

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: ListView(
          children: [
            Container(
              height: 270,
              width: double.infinity,
              decoration: BoxDecoration(
                  //color: Colors.amber,

                  image: DecorationImage(
                      image: NetworkImage(widget.categoriesImage), fit: BoxFit.fill)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 30, bottom: 10),
              child: Text(
                widget.categoriesName,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "C\$ ${widget.categoriesPrice}",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.red[900],
                        fontSize: 16),
                  ),
                  Consumer<CartItemController>(builder: (context, provider, _) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[900],
                        minimumSize: const Size(25, 20),
                      ),
                      onPressed: () async {
                       await provider.addItemToCart(widget.categoriesName);

                      },
                      child: const Text("ADD"),
                    );
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
