import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/controller/home_screen_api_controller.dart';

import 'package:shopping_cart/view/menu_page/product_listing_screen.dart';

import '../../controller/shared_preference_controller.dart';
import '../Cart_page/cart_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartItemController>(builder: (context, provider, _) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "Deliver to Kozhikode",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: FutureBuilder(
            future: getHomeScreenData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final homePageData = snapshot.data!;
                return ListView(
                  children: [
                    //listview builder horizontal
                    SizedBox(
                      height: 180,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: homePageData.data.sliderBanners.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 10),
                          child: Container(
                            height: 60,
                            width: 300,
                            decoration: BoxDecoration(
                                //color: Colors.amber,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(homePageData
                                        .data.sliderBanners[index].bannerImg),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                      ),
                    ),
                    //menu
                    const Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        "Ecp lore menu",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 110,
                      child: FutureBuilder(
                          future: getCategories(),
                          builder: (context, categorySnapshot) {
                            if (categorySnapshot.hasData) {
                              return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: categorySnapshot.data!.data.length,
                                  itemBuilder: (context, index) => Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(12),
                                            child: SizedBox(
                                              height: 50,
                                              width: 50,
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ProductListingScreen(
                                                                  categoryIndex:
                                                                      index)));
                                                },
                                                child: Image.network(
                                                    categorySnapshot.data!
                                                        .data[index].catImg),
                                              ),
                                            ),
                                          ),
                                          Text(categorySnapshot
                                              .data!.data[index].catName)
                                        ],
                                      ));
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }),
                    ),

                    //fetaured Text

                    const Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        "Featured",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 20),
                      ),
                    ),

                    //Featured listview builder horizontal
                    SizedBox(
                      height: 180,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: homePageData.data.featuredProducts.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    //color: Colors.amber,
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(homePageData
                                          .data.featuredProducts[index].image),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(0),
                                child: Text(
                                  homePageData
                                      .data.featuredProducts[index].name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      provider.addItemToCart(homePageData
                                          .data.featuredProducts[index].name);
                                    },
                                    child: Text(
                                      "ADD",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.red[900],
                                          fontSize: 15),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "C\$ ${homePageData.data.featuredProducts[index].price}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.red[900],
                                        fontSize: 13),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                    //list view verical
                    SizedBox(
                      height: 280,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: homePageData.data.additionalBanners.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 120,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                //color: Colors.amber,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(homePageData.data
                                        .additionalBanners[index].bannerImg),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                      ),
                    ),

                    //Text bestseller
                    const Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        "Best Seller",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 20),
                      ),
                    ),

                    //bestseller listview builder vertical
                    SizedBox(
                      height: 400,
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                              homePageData.data.bestsellerProducts.length,
                          itemBuilder: (context, index) => ListTile(
                                leading: Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      //color: Colors.amber,
                                      // borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: NetworkImage(homePageData.data
                                            .bestsellerProducts[index].image),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                title: Text(
                                  homePageData
                                      .data.bestsellerProducts[index].name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500),
                                ),
                                subtitle: Row(
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red[900],
                                        minimumSize: const Size(20, 17),
                                      ),
                                      onPressed: () {
                                        provider.addItemToCart(homePageData.data
                                            .bestsellerProducts[index].name);
                                      },
                                      child: const Text("ADD"),
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      "C\$ ${homePageData.data.bestsellerProducts[index].price}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.red[900],
                                          fontSize: 13),
                                    )
                                  ],
                                ),
                              )),
                    )
                  ],
                );
              } else {
                return const Scaffold(
                  backgroundColor: Colors.white,
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            }),

        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.shopping_bag_outlined,color: Colors.white,),
          backgroundColor: Colors.red[900],
          onPressed: () {
            provider.getCartItem();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Cart_page()),
            );
          },
        ),
      );
    });
  }
}
