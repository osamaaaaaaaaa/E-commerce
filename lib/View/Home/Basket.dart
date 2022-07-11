import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/View/widgets/Custombutton.dart';
import 'package:flutter_app/controller/cardcontroller.dart';
import 'package:flutter_app/model/proudactModel.dart';
import 'package:get/get.dart';

class Basket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<cardcontroller>(
      init: cardcontroller(),
      builder: (controller) => Scaffold(
        body: Container(
          width: size.width,
          color: Colors.grey.shade300,
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
            child: Column(
              children: [
                Row(
                  //  mainAxisAlignment: MainAxisAlignment.values.,
                  children: [
                    IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(Icons.arrow_back_ios)),
                    Container(
                        margin: EdgeInsets.only(left: size.width * 0.25),
                        alignment: Alignment.center,
                        child: Text('Shopping Basket')),
                  ],
                ),
                Container(
                  width: size.width,
                  color: Colors.white,
                  child: Container(
                    padding: EdgeInsets.only(bottom: 120),
                    width: size.width,
                    height: size.height * 0.7,
                    child: ListView.builder(
                        itemCount: controller.listcardmodel.length,
                        itemBuilder: (context, index) => Container(
                              width: size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black87,
                              ),
                              margin: EdgeInsets.all(10),
                              child: Column(children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image.network(
                                          controller.listcardmodel[index].image,
                                          height: 100,
                                          width: 70,
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          controller.listcardmodel[index].name,
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          'Total Price: ${controller.listcardmodel[index].price} EGP',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Text(
                                            'Count: ${controller.listcardmodel[index].quntity}',
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ],
                                    ),
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: Colors.white,
                                      ),
                                      child: IconButton(
                                          onPressed: () {
                                            controller.removeitem(
                                                index,
                                                controller
                                                    .listcardmodel[index].name);
                                          },
                                          icon: Icon(
                                            Icons.remove_shopping_cart_outlined,
                                            size: 17,
                                          )),
                                    )
                                  ],
                                )
                              ]),
                            )),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black26,
                  ),
                  width: size.width,
                  child: Column(children: [
                    Text(
                      'Payment summary',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text('Subtotal: ${controller.totalprice()}'),
                    Text('Delivery fee: 50'),
                    Text('Total price: ${controller.totalprice() + 50}'),
                    SizedBox(
                      height: 15,
                    ),
                    Custombutton(title: 'Check out', ontap: () {})
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
