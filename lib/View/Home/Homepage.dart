import 'package:flutter/material.dart';
import 'package:flutter_app/View/Home/Basket.dart';
import 'package:flutter_app/View/Home/Details.dart';
import 'package:flutter_app/const/const.dart';
import 'package:flutter_app/controller/Homeviewmodel.dart';
import 'package:flutter_app/model/proudactModel.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<String> category = [
      AppImageAsset.men,
      AppImageAsset.women,
      AppImageAsset.bodycare,
    ];
    List<String> categorydescription = [
      'For Men ',
      "For Women",
      "Body Care",
    ];

    return GetBuilder<Homeviewmodel>(
      init: Homeviewmodel(),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              body: Container(
                margin: EdgeInsets.only(top: 30),
                height: MediaQuery.of(context).size.height,
                color: Colors.grey.shade200,
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Anfasek perfumes',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                              onTap: () => Get.to(Basket()),
                              child: ImageIcon(
                                  size: 30,
                                  AssetImage('assets/images/shoppingcart.png')),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: SizedBox(
                          height: size.height * 0.9,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: Icon(
                                        Icons.search,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 10, left: 15),
                                      alignment: Alignment.topLeft,
                                      child: const Text(
                                        'Today Offers',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: size.height * 0.47,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: controller.offersmodel.length,
                                      itemBuilder: ((context, index) =>
                                          Container(
                                            width: size.width * 0.5,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Colors.white),
                                            margin: EdgeInsets.all(10),
                                            child: InkWell(
                                              onTap: (() {}),
                                              child: Column(
                                                //crossAxisAlignment:
                                                //  CrossAxisAlignment.stretch,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            35),
                                                    child: Image.network(
                                                      controller
                                                          .offersmodel[index]
                                                          .image,
                                                      height: size.height * 0.3,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(controller
                                                      .offersmodel[index].name),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    '${controller.offersmodel[index].discount} ',
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      'X ${controller.offersmodel[index].oldprice} EGP X',
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    ' ${controller.offersmodel[index].price} EGP',
                                                    style: const TextStyle(
                                                      color: Colors.grey,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ))),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 10, left: 15),
                                      alignment: Alignment.topLeft,
                                      child: const Text(
                                        'For Women',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      child: const Text(
                                        'See All',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: size.height * 0.45,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          controller.productModelwomen.length,
                                      itemBuilder: ((context, index) =>
                                          Container(
                                            width: size.width * 0.5,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Colors.white),
                                            margin: EdgeInsets.all(10),
                                            child: InkWell(
                                              onTap: (() => Get.to(
                                                  Productsdetails(
                                                      productmodel: controller
                                                              .productModelwomen[
                                                          index]))),
                                              child: Column(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            35),
                                                    child: Image.network(
                                                      controller
                                                          .productModelwomen[
                                                              index]
                                                          .image,
                                                      height: size.height * 0.3,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(controller
                                                      .productModelwomen[index]
                                                      .name),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    '${controller.productModelwomen[index].size}',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    '${controller.productModelwomen[index].price} EGP',
                                                    style: const TextStyle(
                                                        color: Colors.grey),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ))),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
