import 'package:flutter/material.dart';
import 'package:flutter_app/View/Home/Basket.dart';
import 'package:flutter_app/View/widgets/Custombutton.dart';
import 'package:flutter_app/controller/Homeviewmodel.dart';
import 'package:flutter_app/controller/cardcontroller.dart';
import 'package:flutter_app/model/CardModel.dart';
import 'package:flutter_app/model/proudactModel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter_app/services/DatabaseHelper.dart';

class Productsdetails extends StatelessWidget {
  proudactModel productmodel;
  Productsdetails({required this.productmodel});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<cardcontroller>(
      init: cardcontroller(),
      builder: ((controller) => Scaffold(
            body: Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.grey.shade300,
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(
                    top: 30, bottom: 30, left: 10, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () => Get.back(),
                            icon: const Icon(Icons.arrow_back_ios)),
                        IconButton(
                            onPressed: () => Get.to(Basket()),
                            icon: Icon(Icons.shopping_bag_outlined))
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        productmodel.image,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: Column(children: [
                        Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              productmodel.name,
                              style: const TextStyle(fontSize: 25),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              '${(int.parse(productmodel.price)) * (controller.counter.value)} EGP',
                              style: TextStyle(
                                  color: Colors.black26, fontSize: 20),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.grey.shade200),
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: (() =>
                                          controller.decreament()),
                                      icon: Container(
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: Colors.white,
                                          ),
                                          child: Icon(Icons.remove))),
                                  Text(
                                    '${controller.counter.value}',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  IconButton(
                                      onPressed: (() =>
                                          controller.increament()),
                                      icon: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: Colors.black,
                                          ),
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ))),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                            margin: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.11),
                            alignment: Alignment.centerLeft,
                            child: Text(productmodel.size)),
                        const SizedBox(
                          height: 50,
                        ),
                        Custombutton(
                            title: 'Add to basket',
                            ontap: () {
                              controller.addproduct(CardModel(
                                  price:
                                      '${(int.parse(productmodel.price)) * (controller.counter.value)} ',
                                  name: productmodel.name,
                                  image: productmodel.image,
                                  quntity: '${controller.counter.obs}'));
                              Fluttertoast.showToast(
                                msg: "Added To Basket",
                                toastLength: Toast.LENGTH_SHORT,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.grey,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                              Get.back();
                              //  Get.delete<cardcontroller>();
                            })
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
