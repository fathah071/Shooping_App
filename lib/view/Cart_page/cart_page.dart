import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/controller/home_screen_api_controller.dart';
import 'package:shopping_cart/controller/shared_preference_controller.dart';

class Cart_page extends StatefulWidget {
  const Cart_page({super.key});

  @override
  State<Cart_page> createState() => _Cart_pageState();
}

class _Cart_pageState extends State<Cart_page> {
  @override
  void initState() {
    // TODO: implement initState

    // CartItemController().addItemToCart();
    super.initState();
  }
  int count1 =1;

  @override
  Widget build(BuildContext context) {
    return Consumer<CartItemController>(builder: (context, provider, _) {
      count1=provider.count1;

      return Scaffold(
        appBar: AppBar(title: Text('Cart'),backgroundColor: Colors.red[900],),
        body: Column(
          children: [
            SizedBox(
              height:MediaQuery.of(context).size.height/1.3,
              child: ListView.builder(
                itemCount: provider.cartItemList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.red[400],
                        borderRadius: BorderRadius.circular(10)
                      ),

                      height: 100,
                      width: 100,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(provider.cartItemList[index],style: TextStyle(fontSize: 15,fontWeight:FontWeight.w500),),
                        SizedBox(

                          height: 30,
                          width: 30,
                          child: ElevatedButton(onPressed: (){
                            provider.add1(index: index);
                          }, child:Center(child: Text("+")),style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red[900]
                          )),
                        ),
                          Text(provider.count.isNotEmpty?provider.count[index].toString():'0'),
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: ElevatedButton(onPressed: (){
                              provider.less1();
                            }, child:Center(child: Text("-")),style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red[900]
                            ),),
                          ),
                          IconButton(onPressed: (){
                            provider.clearData();
                          }, icon:Icon(Icons.delete_outlined,color: Colors.white,))
                        ],
                      ),
                    ),
                  );
                },

              ),
            ),
            InkWell(
              onTap: (){
                postData(provider.cartItemList);
                },
              child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width/1.3,
                decoration: BoxDecoration(
                    color: Colors.red[900],
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child:
                Text('Place Your Order',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)),
              ),
            )
          ],
        )
      );
    });
  }
}
