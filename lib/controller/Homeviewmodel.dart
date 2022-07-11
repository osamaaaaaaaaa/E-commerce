import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/offersModel.dart';
import 'package:flutter_app/model/proudactModel.dart';
import 'package:get/get.dart';

class Homeviewmodel extends GetxController {
  FirebaseFirestore db = FirebaseFirestore.instance;

  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<proudactModel> _productModelwomen = [];
  List<proudactModel> get productModelwomen => _productModelwomen;

  List<offersModel> _offersModel = [];
  List<offersModel> get offersmodel => _offersModel;

  Homeviewmodel() {
    //  getcategor();
    getproductforwomen();
    getoffers();
  }

  // getcategor() async {
  //   _loading.value = true;
  //   await db.collection('products').get().then((value) => {
  //         print("=================================================="),
  //         print(value.docs[0].data()),
  //         for (int i = 0; i < value.docs.length; i++)
  //           {
  //             _productModel.add(proudactModel.fromJson(value.docs[i].data())),
  //             print('object############################################')
  //           },
  //         _loading.value = false
  //       });

  //   update();
  // }

  getproductforwomen() async {
    _loading.value = true;
    await db.collection('forwomen').get().then((value) => {
          print(value.docs[0].data()),
          for (int i = 0; i < value.docs.length; i++)
            {
              _productModelwomen
                  .add(proudactModel.fromJson(value.docs[i].data())),
            },
          _loading.value = false
        });

    update();
  }

  getoffers() async {
    db.collection('offers').get().then((value) => {
          for (int i = 0; i < value.docs.length; i++)
            _offersModel.add(offersModel.fromJson(value.docs[i].data()))
        });
  }
}
