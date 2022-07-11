import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/controller/Authviewmodel.dart';
import 'package:flutter_app/model/CardModel.dart';
import 'package:flutter_app/services/DatabaseHelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class cardcontroller extends GetxController {
  FirebaseFirestore db = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;

  List<CardModel> _listcardmodel = [];
  List<CardModel> get listcardmodel => _listcardmodel;

  cardcontroller() {
    getcardproduct();
  }

  RxInt counter = 1.obs;
  increament() {
    totalprice();
    counter++;
    update();
  }

  decreament() {
    if (counter == 1) {
      return;
    }
    counter--;
    update();
  }

  addproduct(CardModel model) async {
    db
        .collection('card')
        .doc(user!.uid)
        .collection('card2')
        .doc(model.name)
        .set(model.tojson());
    // _listcardmodel.add(CardModel.fromjson(model));

    update();
  }

  getcardproduct() async {
    await db
        .collection('card')
        .doc(user!.uid)
        .collection('card2')
        .get()
        .then((value) => {
              if (value.docs == null)
                {}
              else
                {
                  for (int i = 0; i < value.docs.length; i++)
                    {
                      _listcardmodel
                          .add(CardModel.fromjson(value.docs[i].data())),
                    },
                }
            });
    update();
  }

  removeitem(int index, String name) {
    db.collection('card').doc(user!.uid).collection('card2').doc(name).delete();
    _listcardmodel.removeAt(index);
    update();
  }

  totalprice() {
    int sum = 0;
    for (int i = 0; i < _listcardmodel.length; i++) {
      sum = sum + int.parse(_listcardmodel[i].price);
    }
    return sum;
    print(sum);
  }
}
